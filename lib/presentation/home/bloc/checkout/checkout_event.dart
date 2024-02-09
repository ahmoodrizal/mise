part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  const factory CheckoutEvent.addItem(Product product) = _AddItem;
  const factory CheckoutEvent.removeItem(Product product) = _RemoveItem;
  const factory CheckoutEvent.storeAddressId(int addressId) = _StoreAddressId;
  const factory CheckoutEvent.storePaymentMethod(String paymentMethod) = _StorePaymentMethod;
  const factory CheckoutEvent.storeShippingService(String shippingService, int shippingCost) = _StoreShippingService;
}
