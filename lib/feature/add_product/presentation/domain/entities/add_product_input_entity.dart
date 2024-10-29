class AddProductInputEntity {
  final String name;
  final String code;
  final String price;
  final String image;
  final bool isFeatured;
  final String? iamgeUrl;

  AddProductInputEntity(
      {required this.name,
      required this.code,
      required this.price,
      required this.image,
      required this.isFeatured,
      this.iamgeUrl});
}
