import 'package:bus/app/presentation/basket/view.dart';
import 'package:bus/app/presentation/homepage/view.dart';
import 'package:bus/app/presentation/menu/view.dart';
import 'package:bus/app/presentation/navbar/bloc.dart';
import 'package:bus/app/presentation/navbar/event.dart';
import 'package:bus/app/presentation/navbar/state.dart';
import 'package:bus/app/presentation/profile/view.dart';
import 'package:bus/app/presentation/search/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Ana Sayfa'),
  BottomNavigationBarItem(icon: Icon(Icons.grid_3x3), label: 'Kategoriler'),
  BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Ara'),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: 'Favoriler',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    label: 'Sepet',
  ),
];

const List<Widget> bottomNavScreens = <Widget>[
  HomeView(),
  SearchView(),
  MenuView(),
  BasketView(),
  UsersPage(),
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navBloc = context.read<NavigationBloc>();

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: bottomNavScreens[state.tabIndex]),
          bottomNavigationBar: Container(
            height: 80,
            color: Colors.black,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                final icons = [
                  Icons.home_outlined,
                  Icons.search_outlined,
                  Icons.circle_outlined,
                  Icons.shopping_bag_outlined,
                  Icons.person,
                ];
                return GestureDetector(
                  onTap: () {
                    navBloc.add(TabChanged(index - 1));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icons[index],
                          color: state.tabIndex == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                        const SizedBox(height: 2),
                        Container(
                          width: 8,
                          height: 2,
                          decoration: BoxDecoration(
                            color: state.tabIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
