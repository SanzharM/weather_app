import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/app_router/app_router.dart';
import 'package:weather_app/src/presentation/widgets/loader/custom_loader.dart';

class OnboardingSplashScreen extends StatelessWidget {
  const OnboardingSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => context.router.replaceAll(const [NavBarRoute()]),
    );

    return Scaffold(
      body: CustomLoader(size: 16.w),
    );
  }
}
