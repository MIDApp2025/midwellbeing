import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'saved_test1_widget.dart' show SavedTest1Widget;
import 'package:flutter/material.dart';

class SavedTest1Model extends FlutterFlowModel<SavedTest1Widget> {
  ///  Local state fields for this page.

  String? selectedCategory;

  List<String> monthList = [];
  void addToMonthList(String item) => monthList.add(item);
  void removeFromMonthList(String item) => monthList.remove(item);
  void removeAtIndexFromMonthList(int index) => monthList.removeAt(index);
  void insertAtIndexInMonthList(int index, String item) =>
      monthList.insert(index, item);
  void updateMonthListAtIndex(int index, Function(String) updateFn) =>
      monthList[index] = updateFn(monthList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
