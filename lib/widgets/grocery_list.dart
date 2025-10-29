import 'package:fifth_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Groceries')),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(groceryItems[index].name),
          leading: Container(
            height: 25,
            width: 25,
            color: groceryItems[index].category.color,
          ),
          trailing: Text('${groceryItems[index].quantity}'),
        ),
      ),
    );
  }
}
