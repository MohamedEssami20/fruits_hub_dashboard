class OrderAddressDetailsModel {
  String? fullName;
  String? email;
  String? address;
  String? phone;
  String? city;
  String? floorName;

  OrderAddressDetailsModel({
    this.fullName,
    this.email,
    this.address,
    this.phone,
    this.city,
    this.floorName,
  });

  factory OrderAddressDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderAddressDetailsModel(
      fullName: json["fullName"],
      email: json["email"],
      address: json["address"],
      phone: json["phone"],
      city: json["city"],
      floorName: json["floorName"],
    );
  }

  // create toJson method;
  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "address": address,
      "phone": phone,
      "city": city,
      "floorName": floorName
    };
  }
}
