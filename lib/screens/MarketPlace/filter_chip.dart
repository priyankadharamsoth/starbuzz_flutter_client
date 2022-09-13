import 'package:flutter/material.dart';

class FilterCat extends StatefulWidget {
  String categoryName;
  void Function(bool)? onSelect;
  bool isSelected;
  FilterCat({Key? key, required this.categoryName, required this.onSelect, required this.isSelected}) : super(key: key);

  @override
  State<FilterCat> createState() => _FilterCatState();
}

class _FilterCatState extends State<FilterCat> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: Image.asset("assets/starbuzz_logo.png"),
      selectedColor: Colors.white,
      padding: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: widget.isSelected ? Colors.orange : Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      showCheckmark: false,
      selected: widget.isSelected,
      label: Text(widget.categoryName),
      //selectedColor: Colors.orange,
      onSelected: widget.onSelect,
    );
  }
}
