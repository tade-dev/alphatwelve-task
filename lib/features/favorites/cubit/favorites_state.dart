part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {

  const FavoritesState._();
  const factory FavoritesState.initial({

    @Default([]) List<Product> favorites
    
  }) = _Initial;

}
