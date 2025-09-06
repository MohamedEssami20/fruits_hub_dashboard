import 'package:uuid/uuid.dart';

String generateProductId() {
  final id = const Uuid().v1();
  return id.toString();
}
