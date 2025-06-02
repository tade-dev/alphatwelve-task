import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:alphatwelve_task/features/cart/presentation/widgets/cart_tile.dart';
import 'package:alphatwelve_task/gen/assets.gen.dart';
import 'package:alphatwelve_task/routes/route.gr.dart';
import 'package:alphatwelve_task/ui/widgets/build_app_bar.dart';
import 'package:alphatwelve_task/ui/widgets/built_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
                          )
                          .animate(
                            delay: Duration(milliseconds: 300 + (index * 200)),
                          )
                          .slideX(
                            begin: 1.2,
                            duration: 700.ms,
                            curve: Curves.easeOutBack,
                          )
                          .fadeIn(
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          )
                          .scale(
                            begin: const Offset(0.8, 0.8),
                            duration: 800.ms,
                            curve: Curves.elasticOut,
                          )
                          .rotate(
                            begin: 0.05,
                            end: 0,
                            duration: 900.ms,
                            curve: Curves.easeOutBack,
                          )
                          .animate(
                            onComplete: (controller) => controller.repeat(reverse: true),
                          )
                          .shimmer(
                            duration: 3000.ms,
                            delay: Duration(milliseconds: 1200 + (index * 300)),
                            color: Colors.white.withOpacity(0.1),
                            angle: 30,
                          ),
                        ),
                      )
                    ),
                    
                    SizedBox(height: 20),
                    
                    Text(
                      "Order Info",
                      style: getBoldStyle(
                        fontSize: 14,
                        color: ColorManager.text,
                      ),
                    )
                    .animate(
                      delay: 900.ms,
                    )
                    .slideX(
                      begin: -0.5,
                      duration: 500.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .fadeIn(
                      duration: 400.ms,
                      curve: Curves.easeOut,
                    )
                    .animate(
                      delay: 1100.ms,
                    )
                    .scaleX(
                      begin: 0,
                      duration: 600.ms,
                      curve: Curves.easeOutBack,
                      alignment: Alignment.centerLeft,
                    ),
                    
                    SizedBox(height: 15),
                    
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
                    ),
                  ]
                ),
              )
            )
            .animate(
              delay: 200.ms,
            )
            .slideY(
              begin: 0.3,
              duration: 700.ms,
              curve: Curves.easeOutCubic,
            )
            .fadeIn(
              duration: 600.ms,
              curve: Curves.easeOut,
            ),
          ],
        ),
      )
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
    ).animate(
        delay: 1000.ms,
      )
      .slideX(
        begin: -0.8,
        duration: 500.ms,
        curve: Curves.easeOutCubic,
      )
      .fadeIn(
        duration: 400.ms,
      )
      .scale(
        begin: const Offset(0.9, 0.9),
        duration: 600.ms,
        curve: Curves.easeOutBack,
      );
  }

}