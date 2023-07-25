import 'package:flutter/material.dart';

class Product{
  final String image,title,description;
  final int price, size, id;
  final Color color;
  double rating = 1.0;

  Product(this.image, this.title, this.description, this.price, this.size,
      this.id, this.color, this.rating);



}