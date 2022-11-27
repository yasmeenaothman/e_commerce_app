import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/assets_helper.dart';
import '../../../helpers/color_helper.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/constants/constant.dart';
import '../../../utils/static_methods.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../auth_screen_controller.dart';
import 'custom_text_field.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key, this.isSignUp = false}) : super(key: key);
  final bool isSignUp;
  final AuthScreenController controller = Get.find<AuthScreenController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: !isSignUp
                ? null
                : StaticMethods.svgPictureWidget(
                    () {
                      controller.cleanControllers();
                      Get.offAndToNamed(Constant.signInScreen);
                    },
                    AssetsHelper.leftArrowIcon,
                    color: ColorHelper.grey_57636F,
                  ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 113.h,
                  ),
                  Text(
                    isSignUp ? Constant.signUp : Constant.signIn,
                    style: AppTextStyle.buildQuickSandBoldTextStyle(
                      color: ColorHelper.blue_126881,
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TabBar(
                    indicatorWeight: 1,
                    indicatorColor: Theme.of(context).primaryColor,
                    onTap: (_)=>controller.cleanControllers(),
                    tabs: [
                      Tab(
                        child: Text(
                          Constant.phoneNumber,
                          style: AppTextStyle.buildZillaSlabMediumTextStyle(
                            color: ColorHelper.grey_57636F,
                            size: 16,
                          ),
                         ),
                      ),
                      Tab(
                        child: Text(
                          Constant.email,
                          style: AppTextStyle.buildZillaSlabMediumTextStyle(
                            color: ColorHelper.grey_57636F,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child:TabBarView(
                        children: [
                          _buildTabContent(),
                          _buildTabContent(isEmail: true),
                        ],
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget _buildTabContent({bool isEmail = false}) {
    return GetBuilder<AuthScreenController>(
      builder: (authController) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Visibility(
                visible: isSignUp,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 10.h),
                  child: CustomTextField(
                    controller: authController.nameController,
                    hintText: Constant.enterName,
                    //onChanged: (s) {},
                  ),
                ),
              ),
              CustomTextField(
                //TODO:here make as isEmail?controller.emailController:controller.phoneController
                controller: authController.emailController,
                hintText: isEmail? Constant.enterEmail :Constant.enterPhoneNum,
                //onChanged: (s) {},
              ),
              Visibility(
                visible: isEmail,
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              Visibility(
                visible: isEmail,
                child: CustomTextField(
                  controller: authController.passwordController,
                  hintText: Constant.password,
                  //onChanged: (s) {},
                  suffixIcon: InkWell(
                    onTap: ()=>authController.setIsPassVisible(),
                    child: Icon(
                      authController.isPassVisible?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined,
                      size:20,
                      color: ColorHelper.greyACBAC3,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Visibility(visible: isEmail, child: _buildRow()),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  btnName: (isSignUp?Constant.signUp:Constant.signIn).toUpperCase(),
                  onPressed: () {
                    //TODO: in sign up with PhoneNumber you will go to verification screen
                    if(isEmail){
                      isSignUp?authController.signUpWithEmailAndPass(): authController.signInWithEmailAndPass();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Visibility(
                visible: !isSignUp,
                child: TextButton(
                  onPressed: (){
                    controller.cleanControllers();
                    Get.toNamed(Constant.signUpScreen);
                  },
                  child: Text(
                    Constant.createAccount,
                    style: AppTextStyle.buildNunitoSansRegularTextStyle(
                      color: ColorHelper.blue_126881,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow() {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Constant.fBAndGoogle
            .map((e) => Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w),
                  child: StaticMethods.svgPictureWidget(() async {
                    isSignUp? null: await e[Constant.funKey]();
                    controller.currentUser==null?print('No User logged yet'):Get.offAndToNamed(Constant.basicScreen);
                    print(controller.currentUser);
                  },e[Constant.iconKey]),
                ))
            .toList(),
      ),
    );
  }
}
