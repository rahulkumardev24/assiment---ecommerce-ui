import 'package:application/helper/custom_text_style.dart';
import 'package:application/widgets/categories_item_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/exclusive_card.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> banner = [
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        "lib/assets/images/banner deals 1.jpg",
        fit: BoxFit.cover,
      ),
    ),

    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        "lib/assets/images/banner deals 2.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        "lib/assets/images/banner 3 deals.jpg",
        fit: BoxFit.cover,
      ),
    ),
  ];

  List<Map<String, dynamic>> listItem = [
    {
      "icon": Icons.phone_android,
      "title": "Mobile",
      "color": Colors.blueAccent,
    },

    {
      "icon": Icons.laptop_mac_rounded,
      "title": "Laptop",
      "color": Colors.greenAccent,
    },

    {"icon": Icons.camera_alt, "title": "Camera", "color": Colors.pink},

    {"icon": Icons.light, "title": "LED", "color": Colors.orange},
  ];

  List<Map<String, dynamic>> exclusiveData = [
    {
      "offer": "32% off",
      "image": "lib/assets/images/vivio2.png",
      "price": "16000",
      "details": "Vivo(6GB)",
    },

    {
      "offer": "40% off",
      "image": "lib/assets/images/Samsung1.png",
      "price": "12000",
      "details": "Samsung(6GB)",
    },

    {
      "offer": "25% off",
      "image": "lib/assets/images/vivio2.png",
      "price": "18000",
      "details": "Vivo(12GB)",
    },

    {
      "offer": "70% off",
      "image": "lib/assets/images/Samsung1.png",
      "price": "10000",
      "details": "Samsung(6GB)",
    },

    {
      "offer": "45% off",
      "image": "lib/assets/images/vivo1.png",
      "price": "20000",
      "details": "Vivo(16GB)",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context).size;
    return Scaffold(
      /// appbar
      appBar: AppBar(
        flexibleSpace: buildAppBar(),
        automaticallyImplyLeading: false,
      ),

      /// body part
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12),
              Divider(thickness: 2),
              SizedBox(height: 21),

              /// slider show here
              CarouselSlider(
                items: banner,
                options: CarouselOptions(
                  height: mqData.height * 0.2,
                  aspectRatio: 16 / 15,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),

              SizedBox(height: mqData.height * 0.01),

              /// kyc box
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: mqData.height * 0.2,
                  width: mqData.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade200, Colors.blue.shade800],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// kuc text
                      Text(
                        "KYC Pending",
                        style: myTextStyle32(
                          fontWeight: FontWeight.w800,
                          textColor: Colors.white,
                        ),
                      ),
                      Text(
                        "You need t provide the required",
                        style: myTextStyle18(
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                        ),
                      ),

                      Text(
                        "document for your account activation",
                        style: myTextStyle18(
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                        ),
                      ),

                      SizedBox(height: 21),

                      /// here click
                      Text(
                        "Click Here ",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 27,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12),

              /// categories
              SizedBox(
                height: mqData.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listItem.length,
                  itemBuilder: (context, index) {
                    return CategoriesItemCard(
                      cardColor: listItem[index]["color"],
                      title: listItem[index]["title"],
                      icon: listItem[index]["icon"],
                    );
                  },
                ),
              ),

              /// Exclusive For You
              Container(
                height: mqData.height * 0.5,
                decoration: BoxDecoration(color: Color(0xff00a3b3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EXCLUSIVE FOR YOU",
                            style: myTextStyle21(
                              fontWeight: FontWeight.w800,
                              textColor: Colors.white,
                            ),
                          ),

                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mqData.height * 0.4,
                      child: ListView.builder(
                        itemCount: exclusiveData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ExclusiveCard(
                            offers: exclusiveData[index]["offer"],
                            mobileImage: exclusiveData[index]["image"],
                            price: exclusiveData[index]["price"],
                            details: exclusiveData[index]["details"],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// chat button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            await FirebaseAuth.instance.signOut();

            // Navigate to Login Screen after logout
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } catch (e) {
            // Optional: handle errors
            print('Logout error: $e');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Logout failed. Please try again.")),
            );
          }
        },

        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        label: Text("Chat", style: myTextStyle21(textColor: Colors.white)),
        icon: Icon(Icons.chat_bubble_outline_rounded, size: 27),
      ),

      /// bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.red,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: "Deals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  /// here we create custom app bar
  Widget buildAppBar() {
    final mqData = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, size: 27),
                SizedBox(
                  width: mqData.width * 0.7,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "lib/assets/icons/ic_splash.png",
                          height: mqData.width * 0.01,
                        ),
                      ),
                      hintText: "Search here",
                      hintStyle: myTextStyle18(
                        fontWeight: FontWeight.bold,
                        textColor: Colors.black38,
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),

                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),

                /// notification icon
                Icon(Icons.notifications, size: 27),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// this is my home screen
