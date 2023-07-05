import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jul",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                "15",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: const NetworkImage(
                    'https://www.simplil'
                        'earn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
                fit: BoxFit.cover,
                width: width - 70,
                height: 180,
              ),
            ),
          )
        ],
      ),
    );
  }
}
