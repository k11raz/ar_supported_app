import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

abstract class HomeViewState extends Equatable {
  const HomeViewState();

  @override
  List<Object> get props => [];
}

class HomeViewInitial extends HomeViewState {}

class HomeViewLoading extends HomeViewState {}

class HomeViewLoaded extends HomeViewState {
  final VideoPlayerController? videoPlayerController;
  final bool isPlaying;

  const HomeViewLoaded({
    required this.isPlaying,
    this.videoPlayerController,
  });

  @override
  List<Object> get props => [isPlaying, ?videoPlayerController];
}

class HomeViewFailure extends HomeViewState {
  final String message;

  const HomeViewFailure(this.message);

  @override
  List<Object> get props => [message];
}
