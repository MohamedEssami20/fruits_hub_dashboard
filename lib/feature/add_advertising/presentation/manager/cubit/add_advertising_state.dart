part of 'add_advertising_cubit.dart';

sealed class AddAdvertisingState extends Equatable {
  const AddAdvertisingState();

  @override
  List<Object> get props => [];
}

final class AddAdvertisingInitial extends AddAdvertisingState {}

// create all state of add advertising;
final class AddAdvertisingLoading extends AddAdvertisingState {}

final class AddAdvertisingSucess extends AddAdvertisingState {}

final class AddAdvertisingError extends AddAdvertisingState {
  final String errorMessage;

  const AddAdvertisingError({required this.errorMessage});
}
