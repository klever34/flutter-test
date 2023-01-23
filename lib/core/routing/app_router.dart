import 'package:freebank/app/auth/app/feature/ui/view/screens/createaccount_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/getstarted_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/homeaddress_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/nextofkin_screen.dart';
import 'package:freebank/app/auth/app/feature/ui/view/screens/otp_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: 'Get Started',
      builder: (ctx, state) => const GetStarted(),
    ),
    GoRoute(
      path: '/create-account',
      name: 'Create Account',
      builder: (ctx, state) => const CreateAccount(),
    ),
    GoRoute(
      path: '/login',
      name: 'Login',
      builder: (ctx, state) => const CreateAccount(),
    ),
    GoRoute(
      path: '/otp',
      name: 'OTP',
      builder: (ctx, state) => const OtpVerification(),
    ),
    GoRoute(
      path: '/home-address',
      name: 'Home Address',
      builder: (ctx, state) => const HomeAddress(),
    ),
    GoRoute(
      path: '/next-of-kin',
      name: 'Next Of Kin',
      builder: (ctx, state) => const NextOfKin(),
    ),
  ],
);
