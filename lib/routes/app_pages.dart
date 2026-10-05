import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:live_chating/routes/app_routes.dart';
import 'package:live_chating/views/auth/login_view.dart';
import 'package:live_chating/views/auth/register_view.dart';
import 'package:live_chating/views/auth/splash_view.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    // GetPage(name: AppRoutes.forgetpassword, page: () => const ForgetPasswordView())
    // binding: BindingsBuilder(() {
    //   Get.put(ForgetPasswordController());
    // })
    // ),
    // GetPage(name: AppRoutes.changePassword, page: () => const ChangePasswordView())
    // binding: BindingsBuilder(() {
    //   Get.put(ChangePasswordController());
    // })
    // ),

    // GetPage(name: AppRoutes.home, page: () => const HomeView())
    // binding: BindingsBuilder(() {
    //   Get.put(HomeController());
    // })
    // ),
    // GetPage(name: AppRoutes.main, page: () => const MainView())
    // binding: BindingsBuilder(() {
    //   Get.put(MainController());
    // })
    // ),
    // GetPage(name: AppRoutes.chat, page: () => const ChatView())
    // binding: BindingsBuilder(() {
    //   Get.put(ChatController());
    // })
    // ),
    // GetPage(name: AppRoutes.profile, page: () => const ProfileView())
    // binding: BindingsBuilder(() {
    //   Get.put(ProfileController());
    // })
    // ),
    // GetPage(name: AppRoutes.Userslist, page: () => const UsersListView())
    // binding: BindingsBuilder(() {
    //   Get.put(UsersListController());
    // })
    // ),

    // GetPage(name: AppRoutes.friends, page: () => const FriendsView())
    // binding: BindingsBuilder(() {
    //   Get.put(FriendsController());
    // })
    // ),

    // GetPage(name: AppRoutes.friendRequests,
    // page: () => const FriendRequestsView()
    // binding: BindingsBuilder(() {
    //   Get.put(FriendRequestsController());
    // })
    // ),

    // GetPage(name: AppRoutes.notifications,
    // page: () => const NotificationsView()
    // binding: BindingsBuilder(() {
    //   Get.put(NotificationsController());
    // })
    // ),
  ];
}
