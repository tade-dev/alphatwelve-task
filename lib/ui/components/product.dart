import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ProductV extends StatelessWidget {

  String image;
  String title;
  double price;

  ProductV({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        SizedBox(height: 8,),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: getRegularStyle(
            color: ColorManager.text,
            fontSize: 14
          ),
        ),
        SizedBox(height: 5,),
        Text(
          "\$$price",
          style: getBoldStyle(
            color: ColorManager.text,
            fontSize: 16
          ),
        ),
      ],
    );
  }
}