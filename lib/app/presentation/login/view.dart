import 'dart:math';
import 'package:bus/app/presentation/login/bloc.dart';
import 'package:bus/app/presentation/login/event.dart';
import 'package:bus/app/presentation/login/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                for (int index = 0; index < state.count; index++)
                  Positioned(
                    left: Random().nextInt(250).toDouble(),
                    top: Random().nextInt(400).toDouble(),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("images/laptop.png"),
                    ),
                  ),
              ],
            );
          },
        ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterIncrementPressed()),
            child: Icon(Icons.add),
          ),

          const SizedBox(height: 10),

           FloatingActionButton(
            onPressed: () => counterBloc.add(CounterDecrementPressed()),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
