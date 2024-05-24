import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grupoestudo/repostiries/api_request.dart';
import 'package:equatable/equatable.dart';
import 'package:grupoestudo/entities/Post.dart';

part 'get_post_event_bloc.dart';
part 'get_post_state_bloc.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  final ApiRequest apiRequest;
  GetPostBloc(this.apiRequest) : super(GetPostStateLoading()) {
    on<GetPostFetchEvent>(_getPosts);
  }

  Future<void> _getPosts(
      GetPostFetchEvent event, Emitter<GetPostState> emit) async {
    emit(GetPostStateLoading());
    await Future.delayed(Duration(seconds: 3));
    try {
      final post = await apiRequest.getPost();
      emit(GetPostStateLoaded(post));
    } catch (e) {
      emit(GetPostStateErro(message: "Erro ao carregar api"));
    }
  }
}
