part of 'get_post_bloc.dart';

abstract class GetPostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPostStateLoading extends GetPostState {}

class GetPostStateLoaded extends GetPostState {
  final List<Posts> posts;

  GetPostStateLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class GetPostStateError extends GetPostState {
  final String message;

  GetPostStateError({required this.message});
  @override
  List<Object?> get props => [message];
}
