import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/core/services/theme.dart';
import 'package:alphatwelve_task/routes/route.gr.dart';
import 'package:alphatwelve_task/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  late AppRouter appRouter;
  late DashboardCubit dashboardCubit;

  @override
  void initState() {
    super.initState();

    appRouter = si<AppRouter>();
    dashboardCubit = si<DashboardCubit>();

  }

  @override
  void dispose() {
    super.dispose();

    dashboardCubit.close();

  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        title: "AlphaTwelve",
        theme: themeData,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    systemGestureInsets:
                        const EdgeInsets.all(400),
                    navigationMode:
                        NavigationMode.directional,
                    textScaler:
                        const TextScaler.linear(1.00)),
                child: Scaffold(
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: true,
                  body: child
                )
              ),
            )
          ],
        )
      ),
    );
  }

  List<SingleChildWidget> get providers {
    return [
      BlocProvider<DashboardCubit>.value(value: dashboardCubit)
    ];
  } 

}