part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {

  const FavoritesState._();
  const factory FavoritesState.initial({

    @Default([]) List<Product> favorites,
    @Default("") String searchText
    
  }) = _Initial;

  bool isFavorite(Product product) {
    return favorites.contains(product);
  }

  List<Product> get filteredFavorites => searchText.isEmpty
      ? favorites
      : favorites.where((product) => product.title.toLowerCase().contains(searchText.toLowerCase())).toList();

}
