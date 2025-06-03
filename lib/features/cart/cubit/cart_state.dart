part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {

  const CartState._();

  const factory CartState.initial({
    
    @Default([]) List<Product> cartItems,
    @Default(0) double totalPrice,
    @Default(0) int itemCount,
    
  }) = _Initial;

  bool get isAddButtonDisabled {
    var product = si<DashboardCubit>().state.selectedProduct;
    bool hasProduct = cartItems.any((item) => item.title == product?.title);
    return hasProduct;
  }

}
