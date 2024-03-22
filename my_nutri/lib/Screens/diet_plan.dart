import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/help_screen.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_plan.dart';

class DietPlanPage extends StatefulWidget {
  const DietPlanPage({super.key});

  @override
  State<DietPlanPage> createState() => _DietPlanPageState();
}

class _DietPlanPageState extends State<DietPlanPage> {
  @override
  Widget build(BuildContext context) {
    String? selectedBodyType;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 10,
            bottom: 120,
            child: Image.asset(
              "assets/07.png",
              fit: BoxFit.cover,
              width: 400,
              height: 500,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Get Your Own\n    Diet Plan",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Color.fromARGB(195, 8, 63, 92),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 120, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(195, 18, 114, 167),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: DropdownButton<String>(
                              value: selectedBodyType,
                              dropdownColor:
                                  const Color.fromARGB(195, 18, 114, 167),
                              underline: Container(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedBodyType = newValue;
                                });
                              },
                              items: <String>[
                                'Slim',
                                'Muscular',
                                'Curvy'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                              hint: const Text(
                                "Body Type",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(195, 18, 114, 167),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Current Body Weight",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(195, 18, 114, 167),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Weight Goal",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(195, 18, 114, 167),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: DropdownButton<String>(
                              value: selectedBodyType,
                              dropdownColor:
                                  const Color.fromARGB(195, 18, 114, 167),
                              underline: Container(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedBodyType = newValue;
                                });
                              },
                              items: <String>[
                                'Balanced Diet',
                                'Meal Planning',
                                'Mindful Eating',
                                'Fiber-rich Foods',
                                'Healthy Snacking',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                              hint: const Text(
                                "Food Habits",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 290,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => const SuggestDietPlan(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.all(17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(195, 18, 114, 167),
                            ),
                            child: const Center(
                              child: Text(
                                "Make Diet Plan ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Need Help?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 97, 96, 96)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HelpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Help Section",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 63, 170, 72)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
