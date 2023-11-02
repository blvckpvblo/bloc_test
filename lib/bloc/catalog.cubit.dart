import 'package:bloc_test/models/catalog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogCubit extends Cubit<Catalog> {
  CatalogCubit() : super(const Catalog());

  void updateCatalog(Catalog catalog) {
    emit(catalog);
  }
}
