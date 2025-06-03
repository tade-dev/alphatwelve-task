import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/core/utils/toast/toast_manager.dart';
import 'package:alphatwelve_task/routes/route.gr.dart';
import 'package:alphatwelve_task/ui/dashboard/model/product.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

@lazySingleton
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState.initial());

  void addToFavorites(Product product) {
    final updatedFavorites = List<Product>.from(state.favorites)..add(product);
    emit(state.copyWith(favorites: updatedFavorites));
    ToastManager.showSuccess(
      si<AppRouter>().navigatorKey.currentContext!, 
      "Product added to favorites"
    );
  }

  void removeFromFavorites(Product product) {
    final updatedFavorites = List<Product>.from(state.favorites)..remove(product);
    emit(state.copyWith(favorites: updatedFavorites));
    ToastManager.showSuccess(
      si<AppRouter>().navigatorKey.currentContext!, 
      "Product removed from favorites"
    );
  }

  void clearFavorites() {
    emit(state.copyWith(favorites: []));
  }

  bool isFavorite(Product product) {
    return state.favorites.contains(product);
  }

  searchTextChanged(String text) {
    emit(state.copyWith(searchText: text));
  }

}
