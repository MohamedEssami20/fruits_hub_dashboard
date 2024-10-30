import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String code;
  final String price;
  final File image;
  final bool isFeatured;
  final String description;
   String? iamgeUrl;

  AddProductInputEntity( 
      {required this.name,
      required this.code,
      required this.price,
      required this.image,
      required this.isFeatured,
      required this.description,
      this.iamgeUrl});
}
