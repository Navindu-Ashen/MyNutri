import 'package:my_nutri/Models/suggest_diet_plans.dart';

List<SuggestDietPlans> suggestdietplan = [
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
   description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
    description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
    description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
    description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
   description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
   description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
    description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
    description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
    description:
        "aaaaaaaaaaaaaaa",
  ),
  SuggestDietPlans(
    title: "Hello World",
    image: "assets/03.jpg",
   description:
        "aaaaaaaaaaaaaaa",
  ),
];

List<SuggestDietPlans> getShuffledList() {
    final shuffledList = List.of(suggestdietplan);
    shuffledList.shuffle();
    return shuffledList;
  }
