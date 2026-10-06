import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:testa_toro/core/utils/constants.dart';

import 'package:testa_toro/features/products/cubit/product_cubit.dart';
import 'package:testa_toro/features/products/repos/product_repo.dart';
import 'package:testa_toro/features/products/screens/product_screen.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Supabase.initialize(
    url: baseUrl,
    anonKey: apiKey,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductCubit(ProductRepo(Supabase.instance.client)),
        ),
      ],
      child: const MyApp(),
    ),
  );

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TestaToro',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductsScreen(),
    );
  }
}
