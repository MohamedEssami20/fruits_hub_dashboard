enum OrderStatus {
  accepted,
  pending,
  delivered,
  cancelled,
}

OrderStatus stringToOrderStatus(String status) {
  var orderStatus = OrderStatus.values.firstWhere((element) {
    var orderStatus = element.name.toString();
    return orderStatus == status;
  });
  return orderStatus;
}
