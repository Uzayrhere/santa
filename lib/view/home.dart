import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santa/model/child_attributes.dart';
import 'package:santa/notifiers/child_notifier.dart';
import 'package:santa/presentation/color.dart';
import 'package:santa/presentation/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the ChildNotifier instance from the context using Provider.
    // This instance is used for accessing and updating the list of children in the app.
    final childNotifier = Provider.of<ChildNotifier>(context);
    // Using MediaQuery to make the UI responsive to different screen sizes.
    double overallWidth = MediaQuery.of(context).size.width;
    double overallHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Christmas Gifts'),
      ),
      // Builds a list of children, each represented as a card in the UI.
      body: ListView.builder(
        itemCount: childNotifier.children.length,
        itemBuilder: (context, index) {
          final child = childNotifier.children[index];

          return Container(
            height: overallHeight / 6,
            width: overallWidth / 1.3,
            // InkWell to make the card tappable, triggering status toggle for the child.

            child: InkWell(
              onTap: () {
                childNotifier.toggleStatus(child.name);
              },
              // Card widget to visually represent each child's details.
              child: Card(
                color: child.isNaughty
                    ? DynamicColor().themeColor
                    : DynamicColor().thirdChoice,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: overallWidth / 3.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Name',
                            style: poppins(fontSize: overallHeight / 40),
                          ),
                          Text(
                            '${child.name}',
                            style: poppins(fontSize: overallHeight / 45),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: overallWidth / 3.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Country',
                            style: poppins(fontSize: overallHeight / 40),
                          ),
                          Text(
                            child.country,
                            style: poppins(fontSize: overallHeight / 45),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: overallWidth / 3.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status',
                            style: poppins(fontSize: overallHeight / 40),
                          ),
                          Text(
                            child.isNaughty ? 'Naughty' : 'Nice',
                            style: poppins(fontSize: overallHeight / 45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // FloatingActionButton to add a new child to the list.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => _showAddChildDialog(context, childNotifier),
      ),
    );
  }

//dialog to add child
  void _showAddChildDialog(BuildContext context, ChildNotifier childNotifier) {
    final nameController = TextEditingController();
    final countryController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Child'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: countryController,
              decoration: const InputDecoration(labelText: 'Country'),
            ),
          ],
        ),
        actions: <Widget>[
          InkWell(
            child: SizedBox(
              width: 70,
              height: 50,
              child: Center(
                child: Text(
                  'Cancel',
                  style: poppins(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          InkWell(
            child: SizedBox(
                width: 70,
                height: 50,
                child: Center(
                  child: Text(
                    'Add',
                    style: poppins(color: Colors.black, fontSize: 15),
                  ),
                )),
            onTap: () {
              final name = nameController.text;
              final country = countryController.text;
              if (name.isNotEmpty && country.isNotEmpty) {
                childNotifier.addChild(Child(name: name, country: country));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
