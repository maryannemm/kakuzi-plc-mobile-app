import 'package:kakuzi_plc/imports.dart';

var myAppRoutes = {
  '/landing-screen': (context) => const IntroScreen(),
  '/login': (context) => CustomerLogin(userType: 'Customer'),
  '/register': (context) => Register(
        userType: 'Customer',
      ),
};
