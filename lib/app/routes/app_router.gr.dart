// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:bus/app/app.dart' as _i15;
import 'package:bus/app/presentation/basket/view.dart' as _i1;
import 'package:bus/app/presentation/favorites/view.dart' as _i2;
import 'package:bus/app/presentation/gallery/view.dart' as _i3;
import 'package:bus/app/presentation/homepage/view.dart' as _i4;
import 'package:bus/app/presentation/menu/view.dart' as _i6;
import 'package:bus/app/presentation/navbar/view.dart' as _i5;
import 'package:bus/app/presentation/product_category/view.dart' as _i7;
import 'package:bus/app/presentation/product_detail/view.dart' as _i8;
import 'package:bus/app/presentation/profile/view.dart' as _i12;
import 'package:bus/app/presentation/search/view.dart' as _i9;
import 'package:bus/app/presentation/settings/view.dart' as _i10;
import 'package:bus/app/presentation/signup/view.dart' as _i11;
import 'package:collection/collection.dart' as _i16;
import 'package:flutter/material.dart' as _i14;

/// generated route for
/// [_i1.BasketView]
class BasketRoute extends _i13.PageRouteInfo<void> {
  const BasketRoute({List<_i13.PageRouteInfo>? children})
    : super(BasketRoute.name, initialChildren: children);

  static const String name = 'BasketRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.BasketView();
    },
  );
}

/// generated route for
/// [_i2.FavoritesView]
class FavoritesRoute extends _i13.PageRouteInfo<void> {
  const FavoritesRoute({List<_i13.PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoritesView();
    },
  );
}

/// generated route for
/// [_i3.GalleryView]
class GalleryRoute extends _i13.PageRouteInfo<void> {
  const GalleryRoute({List<_i13.PageRouteInfo>? children})
    : super(GalleryRoute.name, initialChildren: children);

  static const String name = 'GalleryRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.GalleryView();
    },
  );
}

/// generated route for
/// [_i4.HomeView]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeView();
    },
  );
}

/// generated route for
/// [_i5.LandingView]
class LandingRoute extends _i13.PageRouteInfo<void> {
  const LandingRoute({List<_i13.PageRouteInfo>? children})
    : super(LandingRoute.name, initialChildren: children);

  static const String name = 'LandingRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.LandingView();
    },
  );
}

/// generated route for
/// [_i6.MenuView]
class MenuRoute extends _i13.PageRouteInfo<void> {
  const MenuRoute({List<_i13.PageRouteInfo>? children})
    : super(MenuRoute.name, initialChildren: children);

  static const String name = 'MenuRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.MenuView();
    },
  );
}

/// generated route for
/// [_i7.ProductCategoryView]
class ProductCategoryRoute
    extends _i13.PageRouteInfo<ProductCategoryRouteArgs> {
  ProductCategoryRoute({
    _i14.Key? key,
    required _i15.CategoryEntity category,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         ProductCategoryRoute.name,
         args: ProductCategoryRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'ProductCategoryRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductCategoryRouteArgs>();
      return _i7.ProductCategoryView(key: args.key, category: args.category);
    },
  );
}

class ProductCategoryRouteArgs {
  const ProductCategoryRouteArgs({this.key, required this.category});

  final _i14.Key? key;

  final _i15.CategoryEntity category;

  @override
  String toString() {
    return 'ProductCategoryRouteArgs{key: $key, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductCategoryRouteArgs) return false;
    return key == other.key && category == other.category;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode;
}

/// generated route for
/// [_i8.ProductDetailView]
class ProductDetailRoute extends _i13.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i14.Key? key,
    required _i15.ProductEntity product,
    required List<String> images,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         ProductDetailRoute.name,
         args: ProductDetailRouteArgs(
           key: key,
           product: product,
           images: images,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductDetailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i8.ProductDetailView(
        key: args.key,
        product: args.product,
        images: args.images,
      );
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.product,
    required this.images,
  });

  final _i14.Key? key;

  final _i15.ProductEntity product;

  final List<String> images;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product, images: $images}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailRouteArgs) return false;
    return key == other.key &&
        product == other.product &&
        const _i16.ListEquality().equals(images, other.images);
  }

  @override
  int get hashCode =>
      key.hashCode ^ product.hashCode ^ const _i16.ListEquality().hash(images);
}

/// generated route for
/// [_i9.SearchView]
class SearchRoute extends _i13.PageRouteInfo<void> {
  const SearchRoute({List<_i13.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.SearchView();
    },
  );
}

/// generated route for
/// [_i10.SettingUserView]
class SettingUserRoute extends _i13.PageRouteInfo<void> {
  const SettingUserRoute({List<_i13.PageRouteInfo>? children})
    : super(SettingUserRoute.name, initialChildren: children);

  static const String name = 'SettingUserRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingUserView();
    },
  );
}

/// generated route for
/// [_i11.SignupView]
class SignupRoute extends _i13.PageRouteInfo<void> {
  const SignupRoute({List<_i13.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.SignupView();
    },
  );
}

/// generated route for
/// [_i12.UserView]
class UserRoute extends _i13.PageRouteInfo<void> {
  const UserRoute({List<_i13.PageRouteInfo>? children})
    : super(UserRoute.name, initialChildren: children);

  static const String name = 'UserRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.UserView();
    },
  );
}
