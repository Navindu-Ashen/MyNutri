import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/help_screen.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_plan.dart';

class DietPlanPage extends StatefulWidget {
  const DietPlanPage({super.key});

  @override
  State<DietPlanPage> createState() => _DietPlanPageState();
}

class _DietPlanPageState extends State<DietPlanPage> {
  final _form = GlobalKey<FormState>();

  var selectedBodyWeight = "";
  var selectedWeightGoad = "";

  String? selectedBodyType;
  String? selectedFoodHabit;
  var _isAuthenticating = false;

  void _submit() {
    print("....................................start");

    if (selectedBodyType == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Selecte Body type"),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
      return;
    } else if (selectedFoodHabit == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Selecte Food habbit"),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    FocusScope.of(context).unfocus();

    setState(() {
      _isAuthenticating = true;
    });

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const SuggestDietPlan(),
      ),
    );

    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: screenSize.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backdrop_3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.035,
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                      iconSize: 30,
                      color: const Color.fromARGB(255, 51, 154, 163),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/logoFinal 1.png',
                  // width: screenSize.width * 0.35,
                ),
                Text(
                  "Get Your Own \nDiet Plan",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: const Color.fromARGB(255, 18, 73, 86),
                  ),
                  textAlign: TextAlign.center,
                ),
                Stack(
                  children: [
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 100,
                      child: Image.asset(
                        "assets/9762674E.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Form(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: screenSize.width * 0.9,
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'thin',
                                        child: Text(
                                          'Thin',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'average',
                                        child: Text(
                                          'Average',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'fat',
                                        child: Text(
                                          'Fat',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      labelText: "Body type",
                                      labelStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: screenSize.width * 0.9,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    textCapitalization: TextCapitalization.none,
                                    decoration: InputDecoration(
                                      labelText: "Current Body Weight (Kg)",
                                      labelStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      selectedBodyWeight = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter body weight";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: screenSize.width * 0.9,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    textCapitalization: TextCapitalization.none,
                                    decoration: InputDecoration(
                                      labelText: "Weight Goal",
                                      labelStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      selectedWeightGoad = value!;
                                    },
                                    validator: (value) {
                                      if (selectedFoodHabit == null) {
                                        return "Enter your weight goal";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: screenSize.width * 0.9,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    textCapitalization: TextCapitalization.none,
                                    decoration: InputDecoration(
                                      labelText: "Age",
                                      labelStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      selectedBodyWeight = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Age";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: screenSize.width * 0.9,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    textCapitalization: TextCapitalization.none,
                                    decoration: InputDecoration(
                                      labelText: "Height (cm)",
                                      labelStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      selectedBodyWeight = value!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter height";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: screenSize.width * 0.9,
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    items: [
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text(
                                          'Balanced Diet',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: '2',
                                        child: Text(
                                          'Meal Planning',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: '3',
                                        child: Text(
                                          'Mindful Eating',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: '4',
                                        child: Text(
                                          'Fiber-rich Foods',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: '5',
                                        child: Text(
                                          'Healthy Snacking',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      labelText: "Food Habits",
                                      labelStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 200,
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: _submit,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(17),
                                    shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                   const Color.fromARGB(255, 51, 154, 163),
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
                                      color: Color.fromARGB(255, 81, 81, 81),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HelpScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Help Section",
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 51, 154, 163),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
