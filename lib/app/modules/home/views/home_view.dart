import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('image/main++.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: size.width,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.32, 1.0],
                    colors: const [
                      Color(0x00FFFFFF), // 흰색, 0% 투명
                      Color(0x1AFFFFFF), // 흰색, 10% 투명 (0x1A = 26 in hex, 대략 10% alpha)
                      Color(0xFFFFFFFF), // 흰색, 100% 불투명
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed('/sign-up');
                      },
                      child: Container(
                        width: size.width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: mainColor
                        ),
                        child: Text('가입하기',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed('/login',arguments: {'isAnony':false});
                      },
                      child: Container(
                        width: size.width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffC6CADB)
                        ),
                        child: Text('계정이 이미 있어요',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed('/gym-list');
                      },
                      child: Container(
                        width: size.width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('지점 둘러보기',style: TextStyle(color: mainColor,fontSize: 16,fontWeight: FontWeight.w500),),
                      ),
                    ),
                    SizedBox(height: 35)
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
