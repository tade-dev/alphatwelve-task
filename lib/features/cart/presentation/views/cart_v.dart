import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:alphatwelve_task/features/cart/presentation/widgets/cart_tile.dart';
import 'package:alphatwelve_task/gen/assets.gen.dart';
import 'package:alphatwelve_task/routes/route.gr.dart';
import 'package:alphatwelve_task/ui/widgets/build_app_bar.dart';
import 'package:alphatwelve_task/ui/widgets/built_btn.dart';
import 'package:flutter/material.dart';

class CartV extends StatelessWidget {
  const CartV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 94,
        color: ColorManager.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              BuildBtn(
                onPressed: () {
                  
                },
                label: "Checkout (\$2110)",
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(
              title: "DELIVERY ADDRESS",
              address: "Umuezike Road, Oyo State",
              hasBack: true,
              onback: () {
                si<AppRouter>().pop();
              },
              backLabel: "Your Cart",
            ),
            Expanded(
              child: SizedBox(
                child: ListView(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  children: [
                    Column(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CartTile(
                            image: Assets.images.iphone.path,
                            title: 'Apple iPhone 16 128GB|Teal',
                            price: '700.00',
                            isAvailable: true,
                          ),
                        ),
                      )
                    ),
                    Text(
                      "Order Info",
                      style: getBoldStyle(
                        fontSize: 14,
                        color: ColorManager.text,
                      ),
                    ),
                    Column(
                      children: [
                        buildRowDetails(
                          title: "Subtotal",
                          desc: "\$2100.00",
                        ),
                        buildRowDetails(
                          title: "Shipping",
                          desc: "\$10.00",
                        ),
                        buildRowDetails(
                          title: "Total",
                          desc: "\$2110.00",
                          lastwid: true,
                        )
                      ]
                    )
                  ]
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  buildRowDetails({
    required String title,
    required String desc,
    bool lastwid = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getMediumStyle(
              fontSize: 12,
              color: ColorManager.text,
            ),
          ),
          Text(
            desc,
            style: lastwid ?
            getBoldStyle(
              fontSize: 14,
              color: ColorManager.text,
            ) :
            getMediumStyle(
              fontSize: 12,
              color: ColorManager.text,
            ),
          ),
        ],
      ),
    );
  }

}