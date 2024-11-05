import 'package:flutter/material.dart';

class AnnounceScreen extends StatelessWidget {
  const AnnounceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
   width: 100,
   child: GestureDetector(
    onTap: onPress,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.02,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
          
          ),
          ),

          SizedBox(height: 8),
          Text(
            "annonce",
            style: Theme.of(context).textTheme.
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text("product.price"),
                style:TextStyle(
                  fontSize:14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black12,
                )
                )
            ],
          )
      ],
    ),
   ),
    );
  }
}