part of 'edit_product_cubit.dart';

sealed class EditProductState extends Equatable {
  const EditProductState();

  @override
  List<Object> get props => [];
}

final class EditProductInitial extends EditProductState {}

// create all state of edit product;

final class EditProductLoading extends EditProductState {}

final class EditProductSuccess extends EditProductState {}

final class EditProductFailure extends EditProductState {
  final String errormessage;
  const EditProductFailure({required this.errormessage});
}
