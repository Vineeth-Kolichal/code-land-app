import 'package:dev_test/common/widgets/main_appbar.dart';
import 'package:dev_test/common/widgets/space.dart';
import 'package:dev_test/core/routes/app_routes.dart';
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';
import '../widgets/export_widgets.dart';

final formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Login',
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Space.y(38),
                Hero(
                  tag: 'icon',
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 158,
                    width: 158,
                  ),
                ),
                Space.y(38),
                const Text(
                  'Login to your Account',
                  style: txt20Black500,
                ),
                Space.y(38),
                TextFieldWithTitle(
                  controller: loginBloc.userNameController,
                  title: 'Enter user name',
                ),
                Space.y(20),
                TextFieldWithTitle(
                  controller: loginBloc.passwordController,
                  title: 'Password',
                ),
                Space.y(68),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state.isSuccess) {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.home);
                    }
                    if (state.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: AppTheme.blackColor,
                          content: Text("${state.error}")));
                    }
                  },
                  builder: (context, state) {
                    return LoginButton(
                      isLoading: state.isLoading,
                      onPressed: () {
                        if ((formKey.currentState!.validate() &&
                            state.isLoading == false)) {
                          loginBloc.add(const Login());
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
