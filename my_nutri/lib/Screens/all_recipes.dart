import 'package:flutter/material.dart';

class AllRecipesScreen extends StatefulWidget {
  const AllRecipesScreen({super.key});

  @override
  State<AllRecipesScreen> createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  List<bool> isSelected = [true, false, false];
  int currnetIndex = 0;
  String currentFilter = "";
  @override
  Widget build(BuildContext context) {
    if (currnetIndex == 0) {
      currentFilter = "all";
    } else if (currnetIndex == 1) {
      currentFilter = "veg";
    } else if (currnetIndex == 2) {
      currentFilter = "non-veg";
    }
    print(currentFilter);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 16,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                      iconSize: 30,
                      color: Color.fromARGB(255, 18, 73, 86),
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/logoFinal.png",
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Top Recipes",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 99, 44, 44),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ToggleButtons(
                      isSelected: isSelected,
                      selectedColor: Color.fromARGB(255, 255, 255, 255),
                      color: Color.fromARGB(255, 99, 44, 44),
                      fillColor: Color.fromARGB(255, 99, 44, 44),
                      renderBorder: true,
                      borderRadius: BorderRadius.circular(100),
                      borderWidth: 2,
                      children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Level 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Level 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Level 3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      onPressed: (int newIndex) {
                        setState(() {
                          currnetIndex = newIndex;
                          for (int index = 0;
                              index < isSelected.length;
                              index++) {
                            if (index == newIndex) {
                              isSelected[index] = true;
                            } else {
                              isSelected[index] = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (currentFilter == "all") Text("All content"),
                  if (currentFilter == "veg") Text("Vegetarian"),
                  if (currentFilter == "non-veg") Text("Non-vegetarian"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
