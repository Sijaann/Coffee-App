import 'package:flutter/material.dart';

class CoffeeTiles extends StatelessWidget {
  final String imagePath;
  final String coffeeName;
  Text? coffeeDetails;
  final String price;

  CoffeeTiles({
    super.key,
    required this.imagePath,
    required this.coffeeName,
    this.coffeeDetails,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 275,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(
                    imagePath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            //COFFEE Details
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                coffeeName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(left: 8), child: coffeeDetails),

            SizedBox(
              height: 12,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + price,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
