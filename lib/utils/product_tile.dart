import 'package:flutter/material.dart';
import 'package:mayura_web/model/product_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, this.onPress);
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.thumbnail??'',
                      fit: BoxFit.cover,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 8),
              Text(
                product.name??'',
                maxLines: 2,
                style:
                    TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),

              SizedBox(height: 8),
              Text('\$${product.price}',
                  style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
            ],
          ),
        ),
      ),
    );
  }
}
