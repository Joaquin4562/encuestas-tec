class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = true,
  });
  String headerValue;
  String expandedValue;
  bool isExpanded;

}