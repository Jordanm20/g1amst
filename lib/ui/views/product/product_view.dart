import 'package:g1amst/constants/colors.dart';
import 'package:g1amst/models/cart.dart';
import 'package:g1amst/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductView extends StatelessWidget {
  final Product product;

  ProductView(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: AppColors.text_light,
            ),
            onPressed: () => Navigator.of(context)
                .pushNamed("/cart-view"),//Aún no está creado
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      product.title,
                      style:
                      TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    RatingBar.builder(
                      initialRating: product.rating, // Debes tener este valor en tu objeto Product
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // Puedes agregar aquí alguna lógica para manejar el cambio de calificación
                        print(rating);
                      },
                    ),
                    Expanded(
                        child:
                        Stack(alignment: Alignment.bottomRight, children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 80.0),
                            child: Hero(
                                tag: "${product.id}",
                                child: Image.asset(product.image)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "\$" + product.price.toString(),
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ]),
                          ),
                        ]))
                  ],
                ))),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: Text(
                    "El mejor producto que tu mascota podría desear."),
              ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3.0),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000),
                    onTap: () => {
                      demoCarts.addItem(product)
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.shopping_cart),
                    ),
                  ),
                ),
              )
            ]),
          ),
        )
      ],
    );
  }
}