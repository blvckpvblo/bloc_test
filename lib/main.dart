import 'package:bloc_test/bloc/catalog.cubit.dart';
import 'package:bloc_test/models/catalog.dart';
import 'package:bloc_test/models/item.dart';
import 'package:bloc_test/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => CatalogCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Provider Demo"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(Icons.shopping_bag),
            )
          ],
        ),
        body: BlocBuilder<CatalogCubit, Catalog>(
          builder: (context, catalog) {
            return ListView.builder(
              itemCount: catalog.list.length,
              itemBuilder: (BuildContext context, int index) {
                return SwitchListTile(
                  title: Text(catalog.list[index].label),
                  value: catalog.list[index].value,
                  onChanged: (bool value) {
                    Catalog newCatalog = Catalog(
                        list: catalog.list
                            .map((e) => e.label == catalog.list[index].label
                                ? Item(label: e.label, value: !e.value)
                                : e)
                            .toList());

                    context.read<CatalogCubit>().updateCatalog(newCatalog);
                  },
                );
              },
            );
          },
        ));
  }
}
