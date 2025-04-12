import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/update_product_view.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final updatedProduct = await Navigator.pushNamed(
          context,
          UpdateProductView.id,
          arguments: widget.product,
        );

        if (updatedProduct is ProductModel) {
          setState(() {
            widget.product = updatedProduct;
          });
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 4,
            clipBehavior: Clip.none,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$'
                        '${widget.product.price}',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 50,
            bottom: 70,
            child: Image.network(widget.product.image, height: 100, width: 100),
          ),
        ],
      ),
    );
  }
}
