import 'package:flutter/material.dart';
import 'package:santa/model/child_attributes.dart';

class ChildNotifier with ChangeNotifier {
  List<Child> _children = [];

  // Getter to provide a read-only view of the children list.
  List<Child> get children => _children;

  void addChild(Child child) {
    // Adds a new child to the list and notifies listeners about the update.
    // This is used to update the UI whenever a new child is added.
    _children.add(child);
    notifyListeners();
  }

  void toggleStatus(String childName) {
    // Toggles the 'naughty or nice' status of a child based on their name.
    // It iterates over the list of children to find the matching child and then updates their status.
    for (var child in _children) {
      if (child.name == childName) {
        child.isNaughty = !child.isNaughty;
        break;
      }
    }
    notifyListeners();
  }
}
