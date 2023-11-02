import 'package:bloc_test/bloc/catalog.cubit.dart';
import 'package:bloc_test/models/catalog.dart';
import 'package:bloc_test/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Provider Demo"),
      ),
      body: BlocBuilder<CatalogCubit, Catalog>(
        builder: (context, catalog) {
          List<Item> selectedItems =
              catalog.list.where((Item element) => element.value).toList();
          return ListView.builder(
            itemCount: selectedItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(selectedItems[index].label),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Catalog newCatalog = Catalog(
                        list: catalog.list
                            .map((Item e) =>
                                e.label == selectedItems[index].label
                                    ? Item(label: e.label, value: !e.value)
                                    : e)
                            .toList());

                    context.read<CatalogCubit>().updateCatalog(newCatalog);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
