import 'package:alphatwelve_task/features/cart/presentation/views/cart_v.dart';
import 'package:alphatwelve_task/features/favorites/presentation/view/favorites_v.dart';
import 'package:alphatwelve_task/ui/dashboard/home/home_v.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@lazySingleton
class DashboardCubit extends Cubit<DashboardState> {

  DashboardCubit() : super(DashboardState.initial());

  updateCurrentIndex(int index) {
    emit(state.copyWith(
      currentIndex: index
    ));
  }

}
