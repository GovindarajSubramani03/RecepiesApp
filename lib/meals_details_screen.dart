// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import './dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meals-details';
  const MealDetailScreen({super.key});
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 175,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeals.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.network(
              selectedMeals.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          buildContainer(SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: selectedMeals.ingredients.length,
              itemBuilder: ((ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeals.ingredients[index]),
                    ),
                  )),
            ),
          )),
          buildSectionTitle(context, 'Steps'),
          buildContainer(
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedMeals.steps.length,
                    itemBuilder: ((ctx, index) => ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index + 1)}'),
                          ),
                          title: Text(selectedMeals.steps[index]),
                        )),
                  ),
                ),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
