import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:privilee_assesment/core/config/router/utils/routes.dart';
import 'package:privilee_assesment/core/config/router/utils/transitions.dart';
import 'package:privilee_assesment/features/venues/presentation/venues_page.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: Routes.venues,
      pageBuilder:
          (context, state) =>
              Transitions.fadeTransition(state, VenuesPage()),
    ),
  ],
  errorBuilder: (_, __) => VenuesPage(),
);
