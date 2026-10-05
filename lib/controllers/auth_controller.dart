import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:live_chating/models/user_model.dart';
import 'package:live_chating/services/auth_service.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final Rx<User?> _user = Rx<User?>(null);
  final Rx<UserModel?> _userModel = Rx<UserModel?>(null);
  final RxBool _isLoading = false.obs;
  final RxString _error= ''.obs;
  final RxBool _isinitialized= false.obs;
  User? get user => _user.value;
  UserModel? get userModel => _userModel.value;
  bool get isLoading => _isLoading.value;
  String get error => _error.value;
  bool get isAuthenticated => _user.value != null;
  bool get isInitialized => _isinitialized.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_authService.authStateChanges);
    ever(_user, _handleAuthStateChanged);
  }
  void _handleAuthStateChanged(User? user) async {
    if (user != null) {
       if (Get.currentRoute != AppRoutes.main){
        Get.offAllNamed(AppRoutes.main);
       }
    }else {
      if (Get.currentRoute != AppRoutes.login){
        Get.offAllNamed(AppRoutes.login);
      }
    }
    if (!_isinitialized.value) {
      _isinitialized.value = true;
    }
  }


  void checkInitialization() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _user.value = currentUser;
      Get.offAllNamed(AppRoutes.main);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
    _isinitialized.value = true;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _isLoading.value = true;
    _error.value = '';
    try {
      final userModel = await _authService.signInWithEmailAndPassword(email, password);
      if (userModel != null) {
        _userModel.value = userModel;
        Get.offAllNamed(AppRoutes.main);
      }
    } catch (e) {
      _error.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> registerWithEmailAndPassword(String email, String password, String displayName) async {
    _isLoading.value = true;
    _error.value = '';
    try {
      final userModel = await _authService.registerWithEmailAndPassword(
        email, 
        password, 
        displayName
        );
      if (userModel != null) {
        _userModel.value = userModel;
        Get.offAllNamed(AppRoutes.main);
      }
    } catch (e) {
      _error.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> singout() async {
    try {
      _isLoading.value = true;
      await _authService.signOut();
      _userModel.value = null;
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      _error.value = e.toString();
      Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> deleteAccount() async {
    try {
      _isLoading.value = true;
      await _authService.deleteAccount();
      _userModel.value = null;
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      _error.value = e.toString();
      Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
  void clearError() {
    _error.value = '';
  }

}