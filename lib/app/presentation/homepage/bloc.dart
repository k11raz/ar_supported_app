import 'package:bus/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class HomeViewBloc extends Bloc<HomeViewEvent, HomeViewState> {
  VideoPlayerController? controller;

  HomeViewBloc() : super(HomeViewInitial()) {
    on<InitializeVideoEvent>(initalizeVideo);
  }

  Future<void> initalizeVideo(
    InitializeVideoEvent event,
    Emitter<HomeViewState> emit,
  ) async {
    emit(HomeViewLoading());
    try {
      controller = VideoPlayerController.networkUrl(Uri.parse(event.url));
      await controller!.initialize();
      emit(HomeViewLoaded(videoPlayerController: controller, isPlaying: false));
    } catch (e) {
      emit(HomeViewFailure("Video yüklenemedi: $e"));
    }
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
