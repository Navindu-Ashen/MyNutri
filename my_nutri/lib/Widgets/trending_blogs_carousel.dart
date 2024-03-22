import 'package:flutter/material.dart';
import 'package:my_nutri/Data/trending_blogs.dart';
import 'package:my_nutri/Models/trending_blogs.dart';
import 'package:my_nutri/Screens/trending_blogs/trending_blogs_details.dart';
import 'package:my_nutri/Screens/trending_blogs/trending_blogs_list.dart';
import 'package:my_nutri/Widgets/Inner%20Widgets/trending_blogs.dart';

class TrendingBlogsCarousel extends StatelessWidget {
  const TrendingBlogsCarousel({super.key});

  
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
                "Trending Blogs",
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
                      builder: (ctx) =>  const TrendingBlogAll(),
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
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
             TrendingBlogs trblogs =trendingblog[index];
                 
                 return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TrendingBlogsDetails(
                      trendingb: trblogs,
                    ),
                  ),
                ),
              
                
                child: TrendingBlogsCarousalCard(trblog: trblogs,),
                 );
              
            },
            )
          ),
      ],
    );
  }
}
