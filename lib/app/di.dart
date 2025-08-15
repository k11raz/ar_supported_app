import 'package:bus/app/data/datasources/remote/remote.dart';
import 'package:bus/app/domain/repositories/product.dart';
import 'package:get_it/get_it.dart';
import 'package:bus/app/data/datasources/remote/product.dart';
import 'package:bus/app/data/repositories/product_impl.dart';
import 'package:bus/app/domain/usecases/products/get_product.dart';
import 'package:bus/app/presentation/search/bloc.dart';

final sl = GetIt.instance;

Future<void> dependencyInjection() async {
  
}
