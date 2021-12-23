part of 'gallery_cubit.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();
}

class GalleryInitial extends GalleryState {
  @override
  List<Object> get props => [];
}

class GalleryLoad extends GalleryState {
  @override
  List<Object> get props => [];
}

class GalleryFailed extends GalleryState {
  final String? errorMessage;

  const GalleryFailed({this.errorMessage = somethingWentWrongM});

  @override
  List<Object?> get props => [errorMessage];
}

class GallerySuccess extends GalleryState {
  final List<Token> tokens;

  const GallerySuccess(this.tokens);

  @override
  List<Object> get props => [tokens];
}
