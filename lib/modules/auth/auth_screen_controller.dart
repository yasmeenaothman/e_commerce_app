import 'dart:convert';

import 'package:e_commerce_app/firebase/repo/auth_repo.dart';
import 'package:e_commerce_app/helpers/shared_prefe_helper.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/constants/constant.dart';

class AuthScreenController extends GetxController with WidgetsBindingObserver{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final fbLogin = FacebookAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User? currentUser;
  bool isPassVisible = false;
  setIsPassVisible(){
    isPassVisible = !isPassVisible;
    update();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('fffffffffffff${state}');
    if (state == AppLifecycleState.resumed) {
    getDynamicLink(fromColdState: false);
    }
    super.didChangeAppLifecycleState(state);
  }
  Future googleSignIn() async{
    final googleUser = await _googleSignIn.signIn();
    if(googleUser == null)return;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    getCurrentUser();
    SharedPreferenceHelper.sharedHelper.putString(Constant.uid, currentUser!.uid);
  }
  String checkIsLogin(){
    return getString() == null || getString()==''
        ? Constant.signInScreen
        : Constant.basicScreen;
  }
  signUpWithEmailAndPass() async{
    if(checkControllers()){
      bool isAccepted= await AuthRepo.signUpWithEmailAndPass(emailController.text.trim(), passwordController.text.trim());
      if(isAccepted){
        executeWhenUserAccepted();
      }
    }
    else{
      StaticMethods.showToast(Constant.fill);
    }
  }

  signInWithEmailAndPass() async{
    if(checkControllers(isSignup: false)){
      bool isAccepted= await AuthRepo.signInWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
      if(isAccepted){
        executeWhenUserAccepted();
      }
    }
    else{
      StaticMethods.showToast(Constant.fill);
    }
  }

  sendSignInWithEmailLink() async {
    if(emailController.text.isNotEmpty){
      await AuthRepo.sendSignInWithEmailLink(emailController.text.trim());
    }
    else{
      StaticMethods.showToast(Constant.fill);
    }
  }

  Future<void> getDynamicLink({required bool fromColdState}) async {

    final PendingDynamicLinkData? data =  fromColdState?await FirebaseDynamicLinks.instance.getInitialLink()
        :await FirebaseDynamicLinks.instance.onLink.first;
    print('hhhhhhhhhhhhhh$data');
    if(data!=null){
      final String link = data.link.toString();
      print('mmmmmmmmmmmmmmmmmmmmm$link');
      bool isAccepted = await AuthRepo.signInWithEmailLink(emailController.text.trim(), link);
      if(isAccepted){
        executeWhenUserAccepted();
      }
    }
    else{
      print('mmmmmmmmmmmmmmmmmmmmm noCredentials were found');
    }

  }

  Future signInFB() async{
    final LoginResult result = await fbLogin.login();
    final String token = result.accessToken!.token;
    final response = await http.get(Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
    final profile = jsonDecode(response.body);
    print(profile);
    try{
      final AuthCredential fbCredential =FacebookAuthProvider.credential(token);
      await _auth.signInWithCredential(fbCredential);
      getCurrentUser();
      SharedPreferenceHelper.sharedHelper.putString(Constant.uid, currentUser!.uid);
    }
    catch(e){
      print('error $e');
    }
  }
  void signOut() async{
    await _googleSignIn.signOut();
    await fbLogin.logOut();
    await _auth.signOut();
    getCurrentUser();
    print('currentUser is $currentUser');
    SharedPreferenceHelper.sharedHelper.putString(Constant.uid, '');
    Get.offAllNamed(Constant.signInScreen);
  }
  getCurrentUser(){
    currentUser = _auth.currentUser;
    update();
  }
  bool checkControllers({bool isSignup = true}){
    return (isSignup?nameController.text.isNotEmpty:true)&&emailController.text.isNotEmpty&&passwordController.text.isNotEmpty;
  }
  String? getString(){
    return SharedPreferenceHelper.sharedHelper.getString(Constant.uid);
  }
  cleanControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    update();
  }
  executeWhenUserAccepted(){
    getCurrentUser();
    SharedPreferenceHelper.sharedHelper.putString(Constant.uid, currentUser!.uid);
    Get.offNamed(Constant.basicScreen);
    cleanControllers();
  }
  @override
  void onReady() {
    super.onReady();
    getDynamicLink(fromColdState: true);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

}