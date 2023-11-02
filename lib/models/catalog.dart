import 'item.dart';

class Catalog {
  final List<Item> list;

  const Catalog(
      {this.list = const [
        Item(label: "Water", value: false),
        Item(label: "Fruits", value: false),
        Item(label: "Chips", value: false),
        Item(label: "Chocolat", value: false),
        Item(label: "Juice", value: false),
        Item(label: "Soda", value: false),
        Item(label: "Fish", value: false),
        Item(label: "Beef", value: false),
        Item(label: "Bread", value: false),
      ]});
}
