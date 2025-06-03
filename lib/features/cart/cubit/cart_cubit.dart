import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/core/utils/toast/toast_manager.dart';
import 'package:alphatwelve_task/routes/route.gr.dart';
import 'package:alphatwelve_task/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:alphatwelve_task/ui/dashboard/model/product.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addToCart(Product product) {
    final updatedCartItems = List<Product>.from(state.cartItems)..add(product);
    final updatedTotalPrice = state.totalPrice + product.price;
    final updatedItemCount = state.itemCount + 1;

    emit(state.copyWith(
      cartItems: updatedCartItems,
      totalPrice: updatedTotalPrice,
      itemCount: updatedItemCount,
    ));

    ToastManager.showSuccess(
      si<AppRouter>().navigatorKey.currentContext!, 
      "Item has been added to cart"
    );

  }

  void removeFromCart(Product product) {
    final updatedCartItems = List<Product>.from(state.cartItems)..remove(product);
    final updatedTotalPrice = state.totalPrice - product.price;
    final updatedItemCount = state.itemCount - 1;

    emit(state.copyWith(
      cartItems: updatedCartItems,
      totalPrice: updatedTotalPrice,
      itemCount: updatedItemCount,
    ));

    ToastManager.showSuccess(
      si<AppRouter>().navigatorKey.currentContext!, 
      "Item has been removed from cart"
    );

  }

  void clearCart() {
    emit(CartState.initial());
  }

  updateItemQuantity(Product product, int quantity) {
    final updatedCartItems = state.cartItems.map((item) {
      if (item.title == product.title) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();

    final updatedTotalPrice = updatedCartItems.fold(
      0.0,
      (total, item) => total + (item.price * item.quantity),
    );

    emit(state.copyWith(
      cartItems: updatedCartItems,
      totalPrice: updatedTotalPrice,
    ));
  }

  incrementItemQuantity(Product product) {
    final updatedCartItems = state.cartItems.map((item) {
      if (item.title == product.title) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();

    final updatedTotalPrice = updatedCartItems.fold(
      0.0,
      (total, item) => total + (item.price * item.quantity),
    );

    emit(state.copyWith(
      cartItems: updatedCartItems,
      totalPrice: updatedTotalPrice,
    ));
  }

  decrementItemQuantity(Product product) {
    final updatedCartItems = state.cartItems.map((item) {
      if (item.title == product.title && item.quantity > 1) {
        return item.copyWith(quantity: item.quantity - 1);
      }
      return item;
    }).toList();

    final updatedTotalPrice = updatedCartItems.fold(
      0.0,
      (total, item) => total + (item.price * item.quantity),
    );

    emit(state.copyWith(
      cartItems: updatedCartItems,
      totalPrice: updatedTotalPrice,
    ));
  }

}
