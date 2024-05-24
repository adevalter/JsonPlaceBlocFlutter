import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:grupoestudo/entities/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grupoestudo/repository/api_request_post.dart';
part 'get_post_event.dart';
part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  ApiRequestPost apiRequestPost;

  GetPostBloc(this.apiRequestPost) : super(GetPostStateLoading()) {
    on<GetPostEventFetch>(_getFetch);
  }
  FutureOr<void> _getFetch(
      GetPostEventFetch event, Emitter<GetPostState> emit) async {
    emit(GetPostStateLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final listPost =
          await apiRequestPost.getPost(event.page, event.maxResults);
      emit(GetPostStateLoaded(posts: listPost));
    } catch (e) {
      emit(GetPostStateError(message: "Falha ao Carregar API"));
    }
  }
}
