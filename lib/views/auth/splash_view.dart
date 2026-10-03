import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  
  @override
  void initState() {
    // TODO: implement initState
    
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));

      _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),);
      _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,),
      );

      _animationController.forward();

      // _checkAuthabdNavigate();
      
  }

  // void _checkAuthabdNavigate()async{
  //   await Future.delayed(Duration(seconds: 2));

  //   final authController = Get.put(AuthController(),permanent: true);
  //   await Future.delayed(Duration(milliseconds: 500));

  //   if(authController.isAuthenticated){
  //     Get.offAllNamed(AppRoutes.main);
      
  //   }else{
  //     Get.offAllNamed(AppRoutes.login);
  //   }
  // }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}