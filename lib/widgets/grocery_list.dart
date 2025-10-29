import 'package:fifth_app/models/grocery_item.dart';
import 'package:fifth_app/widgets/new_item.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(builder: (ctx) => NewItem()),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: _groceryItems.isEmpty
          ? Center(
              child: Text(
                'No grocery items added yet.',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_groceryItems.first.id),
                onDismissed: (direction) => _removeItem(_groceryItems[index]),
                child: ListTile(
                  title: Text(_groceryItems[index].name),
                  leading: Container(
                    height: 25,
                    width: 25,
                    color: _groceryItems[index].category.color,
                  ),
                  trailing: Text(
                    '${_groceryItems[index].quantity}',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
    );
  }
}
