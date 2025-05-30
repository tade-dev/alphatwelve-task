part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {

  const DashboardState._();

  const factory DashboardState.initial({

    @Default(0) int currentIndex

  }) = _Initial;

  List<Widget> get views => [
    HomeV(),
    CartV(),
    FavoritesV(),
    FavoritesV(),
  ];

}