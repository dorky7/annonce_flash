import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Assurez-vous d'ajouter ce package à votre pubspec.yaml

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  Position? _currentPosition;
  List<String> previousSearches = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test si les services de localisation sont activés.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Les services de localisation ne sont pas activés.
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Les permissions sont refusées.
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Les permissions sont refusées à jamais.
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
  }

  void _saveSearch(String search) {
    setState(() {
      previousSearches.add(search);
    });
  }

  void _deleteSearch(String search) {
    setState(() {
      previousSearches.remove(search);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Recherche',
            hintStyle: TextStyle(color: Colors.white60),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
          onSubmitted: (value) {
            _saveSearch(value);
          },
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explorer vos annonces',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
             Expanded(
                    child: ListView(
                      children: [
                        // Example categories (replace with dynamic categories based on location)
                        _buildCategoryRow('Immobilier', Icons.home, context),
                        _buildCategoryRow('Automobile', Icons.directions_car, context),
                        _buildCategoryRow('Emploi', Icons.work, context),
                        _buildCategoryRow('Électronique', Icons.electrical_services, context),
                        const SizedBox(height: 20),
                        const Text(
                          'Recherches récentes',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        ...previousSearches.map((search) => _buildSearchItem(search, context)).toList(),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow(String category, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.teal),
          const SizedBox(width: 10),
          Text(
            category,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.teal),
            onPressed: () {
              // Action when category is tapped
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchItem(String search, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            search,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              _deleteSearch(search);
            },
          ),
        ],
      ),
    );
  }
}

