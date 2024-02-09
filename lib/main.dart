import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mise/data/datasources/address_remote_datasource.dart';
import 'package:mise/data/datasources/auth_remote_datasource.dart';
import 'package:mise/data/datasources/category_remote_datasource.dart';
import 'package:mise/data/datasources/fcm_remote_datasource.dart';
import 'package:mise/data/datasources/order_remote_datasource.dart';
import 'package:mise/data/datasources/product_remote_datasource.dart';
import 'package:mise/data/datasources/raja_ongkir_remote_datasource.dart';
import 'package:mise/presentation/address/bloc/address/address_bloc.dart';
import 'package:mise/presentation/address/bloc/city/city_bloc.dart';
import 'package:mise/presentation/address/bloc/create_address/create_address_bloc.dart';
import 'package:mise/presentation/address/bloc/province/province_bloc.dart';
import 'package:mise/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:mise/presentation/auth/bloc/login/login_bloc.dart';
import 'package:mise/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:mise/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:mise/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:mise/presentation/home/bloc/category/category_bloc.dart';
import 'package:mise/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:mise/presentation/home/bloc/new_arrival/new_arrival_bloc.dart';
import 'package:mise/presentation/order/bloc/check_status/check_status_bloc.dart';
import 'package:mise/presentation/order/bloc/create_order/create_order_bloc.dart';
import 'package:mise/presentation/order/bloc/history_order/history_order_bloc.dart';
import 'package:mise/presentation/order/bloc/order_detail/order_detail_bloc.dart';
import 'package:mise/presentation/order/bloc/shipping_cost/shipping_cost_bloc.dart';
import 'package:mise/presentation/order/bloc/tracking/tracking_bloc.dart';

import 'core/constants/colors.dart';
import 'core/router/app_router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FcmRemoteDatasource().initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(CategoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => BestSellerProductBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => NewArrivalBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddressBloc(AddressRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateAddressBloc(AddressRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ProvinceBloc(RajaOngkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CityBloc(RajaOngkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => SubdistrictBloc(RajaOngkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ShippingCostBloc(RajaOngkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => TrackingBloc(RajaOngkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckStatusBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => HistoryOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(OrderRemoteDatasource()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
