import 'package:coffee_ui/utils/coffee_tiles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var cappuccino = {
  "cappuccino.jpg": "With Oat Milk",
  "cappuccino2.jpg": "with chocolate",
  "cappuccino3.jpg": "With Almond Milk"
};
var cappuccinoPrice = {
  "cappuccino.jpg": "4.20",
  "cappuccino2.jpg": "3.14",
  "cappuccino3.jpg": "5.0"
};

var espressoPrice = {
  "espresso.jpg": "3.45",
  "espresso1.jpg": "4.50",
  "espresso2.jpg": "5.50"
};

var espresso = {
  "espresso.jpg": "Ristretto",
  "espresso1.jpg": "Extra Strong",
  "espresso2.jpg": "Martini"
};

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('images/profilePic.jpg'),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
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
              const Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Find the best coffee for you",
                  style: TextStyle(fontSize: 44.0),
                ),
              ),

              const SizedBox(
                height: 25.0,
              ),

              //search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey.shade600,
                    hintText: "Find Your Coffee...",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 25.0,
              ),

              //COFFEE TYPES
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  child: TabBar(
                    tabs: const [
                      Tab(
                        text: "Cappuccino",
                      ),
                      Tab(
                        text: "Espresso",
                      ),
                      Tab(
                        text: "Latte",
                      ),
                      Tab(
                        text: "Flat White",
                      ),
                    ],
                    controller: _tabController,
                    labelColor: Colors.orange,
                    padding: const EdgeInsets.only(right: 15),
                    physics: const BouncingScrollPhysics(),
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorColor: Colors.orange,
                    labelPadding: const EdgeInsets.only(right: 45),
                    indicatorPadding: const EdgeInsets.only(right: 40),
                  ),
                ),
              ),

              //COFFEE TILES
              Container(
                height: 285,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //CAPPUCCINO TILES
                    ListView.builder(
                      itemCount: cappuccino.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: CoffeeTiles(
                              imagePath:
                                  "images/${cappuccino.keys.elementAt(index)}",
                              coffeeName: "Cappuccino",
                              // coffeeDetails: cappuccino.values.elementAt(index),
                              coffeeDetails: Text(
                                cappuccino.values.elementAt(index),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              price: cappuccinoPrice.values.elementAt(index),
                            ),
                          ),
                        );
                      },
                    ),

                    //ESPRESSO TILES
                    ListView.builder(
                      itemCount: espresso.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: CoffeeTiles(
                              imagePath:
                                  "images/${espresso.keys.elementAt(index)}",
                              coffeeName: "Espresso",
                              coffeeDetails: Text(
                                espresso.values.elementAt(index),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              price: espressoPrice.values.elementAt(index),
                            ),
                          ),
                        );
                      },
                    ),

                    //LATTE TILES
                    ListView.builder(
                      itemCount: espresso.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: CoffeeTiles(
                              imagePath:
                                  "images/${espresso.keys.elementAt(index)}",
                              coffeeName: "Latte",
                              price: espressoPrice.values.elementAt(index),
                            ),
                          ),
                        );
                      },
                    ),

                    //Flat White TILES
                    ListView.builder(
                      itemCount: espresso.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: CoffeeTiles(
                              imagePath:
                                  "images/${espresso.keys.elementAt(index)}",
                              coffeeName: "Flat White",
                              price: espressoPrice.values.elementAt(index),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
