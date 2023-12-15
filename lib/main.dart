import 'dart:io';

import 'package:dev_test/core/dependancy_injection/config/config.dart';
import 'package:dev_test/core/routes/generate_route.dart';
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/features/authentication/data/datasources/local_data_source.dart';
import 'package:dev_test/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appDirectory = await getTemporaryDirectory();
  await configureInjection();
  await LocalDataSourceImpl.initDatabase();
  runApp(DevTestApp(
    appRouteGenerate: AppRouteGenerate(),
  ));
}

class DevTestApp extends StatelessWidget {
  const DevTestApp({super.key, required this.appRouteGenerate});
  final AppRouteGenerate appRouteGenerate;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (ctx) => getIt<LoginBloc>())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        onGenerateRoute: appRouteGenerate.onGenerateRoute,
      ),
    );
  }
}

late Directory appDirectory;
