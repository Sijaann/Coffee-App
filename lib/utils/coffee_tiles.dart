import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String price;

  const CoffeeTile(
      {super.key,
      required this.coffeeImagePath,
      required this.coffeeName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black45,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //coffee Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(coffeeImagePath),
              ),

              //Coffee name and additional info
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffeeName,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "With Oat Milk",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              //Price wala row
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$" + price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(Icons.add)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
