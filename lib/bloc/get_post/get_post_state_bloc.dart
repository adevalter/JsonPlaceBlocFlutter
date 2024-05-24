part of 'get_post_bloc.dart';

class GetPostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPostStateLoading extends GetPostState {}

class GetPostStateLoaded extends GetPostState {
  final List<Post> post;

  GetPostStateLoaded(this.post);

  @override
  List<Object?> get props => [post];
}

class GetPostStateErro extends GetPostState {
  final String message;

  GetPostStateErro({required this.message});

  @override
  List<Object?> get props => [message];
}
