part of 'get_post_bloc.dart';

class GetPostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPostEventFetch extends GetPostEvent {
  final int page;
  final int maxResults;

  GetPostEventFetch({required this.page, required this.maxResults});
}
