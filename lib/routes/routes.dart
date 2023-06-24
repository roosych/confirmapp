import 'package:test_app/screens/balance/balance_main.dart';
import 'package:test_app/screens/dashboard_screen.dart';
import 'package:test_app/screens/money/requests/money_requests_screen.dart';
import 'package:test_app/screens/procurement/orders/procurement_orders_screen.dart';
import 'package:test_app/screens/procurement/requests/procurement_requests_screen.dart';

final routes = {
  '/dashboard': (context) => const DashboardScreen(),
  '/procurement-requests': (context) => ProcurementRequestsScreen(),
  '/procurement-orders': (context) => ProcurementOrdersScreen(),
  '/money-requests': (context) => MoneyRequestsScreen(),
  '/money-spending': (context) => const DashboardScreen(),
  '/vacations': (context) => const DashboardScreen(),
  'balance': (context) => const BalanceScreen(),
  '/balance-accounts': (context) => const DashboardScreen(),
};
