import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/login_page.dart';
import 'package:my_nutri/Widgets/suggest_diet_carousel.dart';
import 'package:my_nutri/Widgets/top_recipes_carousel.dart';
import 'package:my_nutri/Widgets/trending_blogs_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int _currentTab = 0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Hello Navindu!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 103, 203, 106),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Text(
                    "Find, track and eat healthy food.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 249, 231, 194),
                            // image: const DecorationImage(
                            //   image: AssetImage("assets/01.jpg"),
                            //
                            // ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 190,
                          left: 10,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 193, 52, 41),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Read More...",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 50,
                          left: 20,
                          child: Text(
                            "The Pros and\nCons of fast food.",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 86, 41, 25),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 20,
                          left: 20,
                          child: Text(
                            "Trending",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 193, 52, 41),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 110,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(195, 18, 114, 167),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Positioned(
                          top: 35,
                          bottom: 35,
                          right: 15,
                          left: 200,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Create Plan",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(195, 18, 114, 167),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 26,
                          left: 30,
                          child: Text(
                            "Get Your\nOwn Diet Plan",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Ado ado ado meh boru marisi danda epa harida, Umberlath manussayo apith manussayo",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TopRecipesCarousel(),
                const TrendingBlogsCarousel(),
                const SuggestDietCarousel(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          selectedItemColor: const Color.fromARGB(195, 14, 192, 106),
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                size: 32,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
