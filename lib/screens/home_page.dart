import 'package:coffee_ui/utils/coffee_tiles.dart';
import 'package:coffee_ui/utils/coffee_types.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                radius: 15.0,
                child: ClipRRect(
                  child: Image.asset('images/sanjee.png'),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
          ],
          selectedItemColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //FInd the BEst coffee for you
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Find the best coffee for you",
                  style: TextStyle(fontSize: 44.0),
                ),
              ),

              SizedBox(
                height: 25.0,
              ),

              //search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey.shade600,
                      hintText: "Find Your Coffee...",
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600))),
                ),
              ),

              SizedBox(
                height: 25.0,
              ),

              //coffee Types
              Container(
                height: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return CoffeeTypes(
                        coffeeTypes: coffeeTypes[index][0],
                        isSelected: coffeeTypes[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        });
                  }),
                  itemCount: coffeeTypes.length,
                ),
              ),

              SizedBox(
                height: 15.0,
              ),

              //coffee Tiles
              Container(
                height: 350,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CoffeeTile(
                      coffeeImagePath: "images/epsresso.jpg",
                      coffeeName: "Espresso",
                      price: "3.50",
                    ),
                    CoffeeTile(
                      coffeeImagePath: "images/cappuccino.jpg",
                      coffeeName: "Cappuccino",
                      price: "4.20",
                    ),
                    CoffeeTile(
                      coffeeImagePath: "images/latte.jpg",
                      coffeeName: "Latte",
                      price: "4.50",
                    ),
                  ],
                ),
              )
              //coffee tiles
            ],
          ),
        ));
  }

  final List coffeeTypes = [
    //[Coffee type, isSelected]
    ["Cappuccino", true], ["Espresso", false], ["Latte", false],
    ["Flat White", false], ["Americano", false]
  ];
  //user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }

      coffeeTypes[index][1] = true;
    });
  }
}
