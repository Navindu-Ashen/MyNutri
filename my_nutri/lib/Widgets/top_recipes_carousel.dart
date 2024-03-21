import 'package:flutter/material.dart';
import 'package:my_nutri/Data/top_recipes.dart';
import 'package:my_nutri/Models/top_recipes.dart';
import 'package:my_nutri/Screens/top_recipes/top_recipes_details.dart';
import 'package:my_nutri/Screens/top_recipes/top_recipes_list.dart';
import 'package:my_nutri/Widgets/Inner%20Widgets/top_recipes.dart';

class TopRecipesCarousel extends StatelessWidget {
  const TopRecipesCarousel({super.key});

  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Top Recipes",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) =>  const TopRecipesAll(),
                    ),
                  );
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                   
                    letterSpacing: 1.0,
                    color: Color.fromARGB(195, 18, 114, 167),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
             TopRecipes recipes =toprecipe[index];
                 
                 return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TopRecipesDetails(
                      topr: recipes,
                    ),
                  ),
                ),
              
                
                child: TopRecipesCarousalCard(trecipes: recipes,),
                 );
              
            },
            )
          ),
      ],
    );
  }
}
