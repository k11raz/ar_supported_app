import 'package:equatable/equatable.dart';

abstract class HomeViewEvent extends Equatable {
  const HomeViewEvent();

  @override
  List<Object?> get props => [];
}

class InitializeVideoEvent extends HomeViewEvent {
  final String url;
  const InitializeVideoEvent(this.url);

   @override
  List<Object?> get props => [url];
}
