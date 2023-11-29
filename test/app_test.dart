import 'package:flutter_test/flutter_test.dart';
import 'package:santa/model/child_attributes.dart';
import 'package:santa/notifiers/child_notifier.dart';

void main() {
  group('ChildNotifier Tests', () {
    test('Adding a child updates the children list', () {
      final notifier = ChildNotifier();
      final child = Child(name: 'Test Child', country: 'Test Country');

      notifier.addChild(child);

      expect(notifier.children.contains(child), isTrue);
    });

    test('Toggling a child\'s status updates correctly', () {
      final notifier = ChildNotifier();
      final child = Child(name: 'Test Child', country: 'Test Country');

      notifier.addChild(child);
      notifier.toggleStatus(child.name);

      expect(notifier.children.first.isNaughty, isTrue);
    });
  });
}
