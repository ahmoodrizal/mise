import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mise/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:mise/presentation/home/models/product_quantity.dart';
import 'package:mise/presentation/order/bloc/create_order/create_order_bloc.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../models/bank_account_model.dart';
import '../widgets/payment_method.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPayment = ValueNotifier<int>(0);

    List<BankAccountModel> banksLimit = [banks[0], banks[1]];

    void seeAllTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: ColoredBox(
                    color: AppColors.light,
                    child: SizedBox(height: 8.0, width: 55.0),
                  ),
                ),
                const SpaceHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.light,
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(16.0),
                ValueListenableBuilder(
                  valueListenable: selectedPayment,
                  builder: (context, value, _) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PaymentMethod(
                      isActive: value == banks[index].code,
                      data: banks[index],
                      onTap: () {
                        // selectedPayment.value = banks[index].code;
                        // if (banksLimit.first != banks[index]) {
                        //   banksLimit[1] = banks[index];
                        // }
                        // context.pop();
                      },
                    ),
                    separatorBuilder: (context, index) => const SpaceHeight(14.0),
                    itemCount: banks.length,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void buyNowTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: ColoredBox(
                    color: AppColors.light,
                    child: SizedBox(height: 8.0, width: 55.0),
                  ),
                ),
                const SpaceHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pesananmu dalam Proses',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.light,
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Assets.images.processOrder.image(),
                ),
                const SpaceHeight(50.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          context.goNamed(
                            RouteConstants.trackingOrder,
                            pathParameters: PathParameters().toMap(),
                          );
                        },
                        label: 'Lacak Pesanan',
                      ),
                    ),
                    const SpaceWidth(20.0),
                    Flexible(
                      child: Button.filled(
                        onPressed: () {
                          context.goNamed(
                            RouteConstants.root,
                            pathParameters: PathParameters().toMap(),
                          );
                        },
                        label: 'Back to Home',
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(20.0),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const SpaceHeight(30.0),
          Row(
            children: [
              const Text(
                'Metode Pembayaran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: seeAllTap,
                child: const Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SpaceHeight(20.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              final paymentVaName = state.maybeWhen(
                orElse: () => '',
                loaded: (_, __, ___, ____, _____, paymentVaName) => paymentVaName,
              );
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => PaymentMethod(
                  isActive: paymentVaName == banksLimit[index].code,
                  data: banksLimit[index],
                  onTap: () {
                    context.read<CheckoutBloc>().add(CheckoutEvent.storePaymentMethod(banksLimit[index].code));
                  },
                ),
                separatorBuilder: (context, index) => const SpaceHeight(14.0),
                itemCount: banksLimit.length,
              );
            },
          ),
          const SpaceHeight(36.0),
          const Divider(),
          const SpaceHeight(8.0),
          const Text(
            'Ringkasan Pembayaran',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(12.0),
          Row(
            children: [
              const Text(
                'Total Belanja',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  final subtotal = state.maybeWhen(
                    orElse: () => 0,
                    loaded: (products, _, __, ___, ____, _____) {
                      return products.fold(0, (previousValue, element) => previousValue + (element.product.price! * element.quantity));
                    },
                  );
                  return Text(
                    subtotal.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(5.0),
          Row(
            children: [
              const Text(
                'Biaya Layanan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  final shippingCost = state.maybeWhen(
                    orElse: () => 0,
                    loaded: (_, __, ___, _____, shippingCost, ______) => shippingCost,
                  );
                  return Text(
                    shippingCost.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(8.0),
          const Divider(),
          const SpaceHeight(24.0),
          Row(
            children: [
              const Text(
                'Total Tagihan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  final totalCost = state.maybeWhen(
                    orElse: () => 0,
                    loaded: (products, _, __, ___, shippingCost, ____) {
                      return products.fold(0, (previousValue, element) => previousValue + (element.product.price! * element.quantity) + shippingCost);
                    },
                  );
                  return Text(
                    totalCost.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SpaceHeight(20.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              final paymentMethod = state.maybeWhen(
                orElse: () => '',
                loaded: (_, __, paymentMethod, ___, ____, _____) {
                  return paymentMethod;
                },
              );
              final shippingService = state.maybeWhen(
                orElse: () => '',
                loaded: (_, __, ___, shippingService, ____, _____) {
                  return shippingService;
                },
              );
              final shippingCost = state.maybeWhen(
                orElse: () => 0,
                loaded: (_, __, ___, ____, shippingCost, _____) {
                  return shippingCost;
                },
              );
              final paymentVaName = state.maybeWhen(
                orElse: () => '',
                loaded: (_, __, ___, _____, ____, paymentVaName) {
                  return paymentVaName;
                },
              );
              final products = state.maybeWhen(
                orElse: () => [],
                loaded: (products, __, ___, _____, ____, _) {
                  return products;
                },
              );
              final addressId = state.maybeWhen(
                orElse: () => 0,
                loaded: (__, addressId, ___, _____, ____, _) {
                  return addressId;
                },
              );
              return BlocListener<CreateOrderBloc, CreateOrderState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () => {},
                    loaded: (orderResponseModel) {
                      context.pushNamed(
                        RouteConstants.paymentWaiting,
                        pathParameters: PathParameters().toMap(),
                        extra: orderResponseModel.order!.id,
                      );
                    },
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red[300],
                          content: Text(message),
                        ),
                      );
                    },
                  );
                },
                child: BlocBuilder<CreateOrderBloc, CreateOrderState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      orElse: () {
                        return Button.filled(
                          disabled: paymentMethod == '',
                          onPressed: () {
                            context.read<CreateOrderBloc>().add(CreateOrderEvent.doOrder(
                                addressId: addressId,
                                paymentMethod: paymentMethod,
                                shippingService: shippingService,
                                shippingCost: shippingCost,
                                paymentVaName: paymentVaName,
                                products: products as List<ProductQuantity>));
                          },
                          label: 'Bayar Sekarang',
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
