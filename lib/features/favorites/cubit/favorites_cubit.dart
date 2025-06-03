import 'package:alphatwelve_task/ui/dashboard/model/product.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

@lazySingleton
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState.initial());
}
