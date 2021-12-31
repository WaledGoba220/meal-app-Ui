import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  const MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  // ignore: missing_return
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return ' Simple';
        break;
      case Complexity.Challenging:
        return ' Challenging';
        break;
      case Complexity.Hard:
        return ' Hard';
        break;
      default:
        return 'UnKnown';
        break;
    }
  }

  String get affordText {
    switch (affordability) {
      case Affordability.Affordable:
        return ' Affordable';
        break;
      case Affordability.Pricey:
        return ' Pricey';
        break;
      case Affordability.Luxurious:
        return ' Luxurious';
        break;
      default:
        return 'UnKnown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) {
      //if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: Column(children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.alarm),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$complexityText '),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$affordText'),
                      ],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
