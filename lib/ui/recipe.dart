import 'package:demo_app/modal/onbordingmodal.dart';
import 'package:flutter/material.dart';
import '/modal/recipemodal.dart';

class Recipe extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(getRecipes.length, (index) {
        return InkWell(
          onTap: () => { print("tap")},
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  children: [
                    Expanded(
                        child: Image.network(
                      getRecipes[index].imageURL,
                      repeat: ImageRepeat.noRepeat,
                      errorBuilder: (_,__,___)=>Image.asset(model[0].imgSrc,width: double.maxFinite,fit: BoxFit.cover),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            getRecipes[index].name,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.timer),
                                  Text(getRecipes[index].duration),
                                ],
                              ),
                              Text(getRecipes[index].type)
                            ],
                          )
                        ],
                      ),
                    ),
                    // SizedBox(height: 30),
                  ],
                ),
              )),
        );
      }),
    );
  }
}
