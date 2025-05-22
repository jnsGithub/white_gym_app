import 'package:get/get.dart';

import '../modules/gymList/bindings/gym_list_binding.dart';
import '../modules/gymList/views/gym_detail.dart';
import '../modules/gymList/views/gym_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mainHome/bindings/main_home_binding.dart';
import '../modules/mainHome/views/main_home_view.dart';
import '../modules/mainHome/views/pause_ticket_view.dart';
import '../modules/myPage/bindings/my_page_binding.dart';
import '../modules/myPage/views/card_list_view.dart';
import '../modules/myPage/views/edit_hp_view.dart';
import '../modules/myPage/views/my_page_view.dart';
import '../modules/myPage/views/payment_list_view.dart';
import '../modules/myPage/views/setting_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/ot/bindings/ot_binding.dart';
import '../modules/ot/views/ot_success_view.dart';
import '../modules/ot/views/ot_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_detail_view.dart';
import '../modules/payment/views/payment_success_view.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/pt/bindings/pt_binding.dart';
import '../modules/pt/views/pt_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_completed.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../modules/suggestion/bindings/suggestion_binding.dart';
import '../modules/suggestion/views/suggestion_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_HOME,
      page: () => const MainHomeView(),
      binding: MainHomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_COMPLETED,
      page: () => const SignUpCompleted(),
    ),
    GetPage(
      name: _Paths.GYM_LIST,
      page: () => const GymListView(),
      binding: GymListBinding(),
    ),
    GetPage(
      name: _Paths.GYM_DETAIL,
      page: () => const GymDetail(),
      binding: GymDetailBinding(),
    ),
    GetPage(
      name: _Paths.PAUSE_TICKET,
      page: () => const PauseTicketView(),
      binding: PauseTicketBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAIL,
      page: () => const PaymentDetailView(),
      binding: PaymentDetailBinding(),
    ),
    GetPage(
      name: _Paths.MY_PAGE,
      page: () => const MyPageView(),
      binding: MyPageBinding(),
    ),
    GetPage(
      name: _Paths.CARD_LIST,
      page: () => const CardListView(),
      binding: CardListBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_LIST,
      page: () => const PaymentListView(),
      binding: PaymentListBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_HP,
      page: () => const EditHpView(),
      binding: EditHpBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS,
      page: () => const PaymentSuccessView(),
      binding: PaymentSuccessBinding(),
    ),
    GetPage(
      name: _Paths.OT,
      page: () => const OtView(),
      binding: OtBinding(),
    ),
    GetPage(
      name: _Paths.OT_SUCCESS,
      page: () => const OtSuccessView(),
      binding: OtBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SUGGESTION,
      page: () => const SuggestionView(),
      binding: SuggestionBinding(),
    ),
    GetPage(
      name: _Paths.PT,
      page: () => const PtView(),
      binding: PtBinding(),
    ),
  ];
}
