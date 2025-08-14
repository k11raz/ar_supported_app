// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:bus/app/presentation/basket/view.dart' as _i1;
import 'package:bus/app/presentation/gallery/view.dart' as _i2;
import 'package:bus/app/presentation/homepage/view.dart' as _i3;
import 'package:bus/app/presentation/menu/view.dart' as _i5;
import 'package:bus/app/presentation/navbar/view.dart' as _i4;
import 'package:bus/app/presentation/product_detail/view.dart' as _i6;
import 'package:bus/app/presentation/profile/view.dart' as _i8;
import 'package:bus/app/presentation/search/view.dart' as _i7;
import 'package:collection/collection.dart' as _i11;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.BasketView]
class BasketRoute extends _i9.PageRouteInfo<void> {
  const BasketRoute({List<_i9.PageRouteInfo>? children})
    : super(BasketRoute.name, initialChildren: children);

  static const String name = 'BasketRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.BasketView();
    },
  );
}

/// generated route for
/// [_i2.GalleryView]
class GalleryRoute extends _i9.PageRouteInfo<void> {
  const GalleryRoute({List<_i9.PageRouteInfo>? children})
    : super(GalleryRoute.name, initialChildren: children);

  static const String name = 'GalleryRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.GalleryView();
    },
  );
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeView();
    },
  );
}

/// generated route for
/// [_i4.LandingView]
class LandingRoute extends _i9.PageRouteInfo<void> {
  const LandingRoute({List<_i9.PageRouteInfo>? children})
    : super(LandingRoute.name, initialChildren: children);

  static const String name = 'LandingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.LandingView();
    },
  );
}

/// generated route for
/// [_i5.MenuView]
class MenuRoute extends _i9.PageRouteInfo<void> {
  const MenuRoute({List<_i9.PageRouteInfo>? children})
    : super(MenuRoute.name, initialChildren: children);

  static const String name = 'MenuRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.MenuView();
    },
  );
}

/// generated route for
/// [_i6.ProductDetailView]
class ProductDetailRoute extends _i9.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i10.Key? key,
    required String name,
    required String price,
    required List<String> images,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         ProductDetailRoute.name,
         args: ProductDetailRouteArgs(
           key: key,
           name: name,
           price: price,
           images: images,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductDetailRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i6.ProductDetailView(
        key: args.key,
        name: args.name,
        price: args.price,
        images: args.images,
      );
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.name,
    required this.price,
    required this.images,
  });

  final _i10.Key? key;

  final String name;

  final String price;

  final List<String> images;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, name: $name, price: $price, images: $images}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailRouteArgs) return false;
    return key == other.key &&
        name == other.name &&
        price == other.price &&
        const _i11.ListEquality().equals(images, other.images);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      name.hashCode ^
      price.hashCode ^
      const _i11.ListEquality().hash(images);
}

/// generated route for
/// [_i7.SearchView]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute({List<_i9.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SearchView();
    },
  );
}

/// generated route for
/// [_i8.UserView]
class UserRoute extends _i9.PageRouteInfo<void> {
  const UserRoute({List<_i9.PageRouteInfo>? children})
    : super(UserRoute.name, initialChildren: children);

  static const String name = 'UserRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.UserView();
    },
  );
}
