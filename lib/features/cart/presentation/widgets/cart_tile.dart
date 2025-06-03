import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/features/cart/cubit/cart_cubit.dart';
import 'package:alphatwelve_task/gen/assets.gen.dart';
import 'package:alphatwelve_task/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CartTile extends StatelessWidget {
  String image;
  String title;
  String price;
  int quantity;
  bool? isAvailable;

  CartTile({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {

    var cartCubit = si<CartCubit>();

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ColorManager.card,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.asset(image, height: 100, width: 100, fit: BoxFit.cover),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.gray2,
                        fontFamily: FontFamily.sfpro,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.gray2,
                        fontFamily: FontFamily.sfpro,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "In stock",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.success,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Row(
                          children: [
                            buildActionButton(
                              bgColor: ColorManager.gray3,
                              onPressed: () {
                                cartCubit.decrementItemQuantity(
                                  cartCubit.state.cartItems.firstWhere(
                                    (item) => item.image == image && item.title == title,
                                  ),
                                );
                              },
                              iconColor: ColorManager.icon,
                              icon: Assets.icons.minus,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.gray2,
                                  fontFamily: FontFamily.sfpro,
                                ),
                              ),
                            ),
                            buildActionButton(
                              bgColor: ColorManager.white,
                              onPressed: () {
                                cartCubit.incrementItemQuantity(
                                  cartCubit.state.cartItems.firstWhere(
                                    (item) => item.image == image && item.title == title,
                                  ),
                                );
                              },
                              hasBorder: true,
                              icon: Assets.icons.add,
                            ),
                          ],
                        ),
                        Spacer(),
                        buildActionButton(
                          onPressed: () {
                            cartCubit.removeFromCart(
                              cartCubit.state.cartItems.firstWhere(
                                (item) => item.image == image && item.title == title,
                              ),
                            );
                          },
                          bgColor: ColorManager.white,
                          icon: Assets.icons.delete,
                          iconColor: ColorManager.gray,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  buildActionButton({
    Color? bgColor,
    Color? iconColor,
    required VoidCallback? onPressed,
    bool hasBorder = false,
    required String icon,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: bgColor,
          border: hasBorder ? Border.all(color: ColorManager.gray3) : null,
          shape: BoxShape.circle,
        ),
        child: Center(child: SvgPicture.asset(icon, color: iconColor)),
      ),
    );
  }
}
