class ModularBathroom {
  int productId;
  String productImage;
  String productName;
  String brand;
  int originalPrice;
  int discountedPrice;
  int discountPercentage;
  double rating;
  bool fav = false;

  ModularBathroom(this.fav,
      {required this.productId,
      required this.productImage,
      required this.productName,
      required this.brand,
      required this.originalPrice,
      required this.discountedPrice,
      required this.discountPercentage,
      required this.rating});
}
