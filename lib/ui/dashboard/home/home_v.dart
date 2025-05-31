import 'package:alphatwelve_task/gen/fonts.gen.dart';
import 'package:alphatwelve_task/ui/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';

class HomeV extends StatelessWidget {
  const HomeV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(
              title: "DELIVERY ADDRESS", 
              address: "Umuezike Road, Oyo State",
              searchable: true,
              hasBack: true,
              onback: (){},
              backLabel: "Technology"
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                children: [
                  Text(
                    "Smartphones, Laptops &\nAssecories",
                    style: TextStyle(
                      fontFamily: FontFamily.ibmmono,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}