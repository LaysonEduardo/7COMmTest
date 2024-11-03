import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/src/core/components/custom_button.dart';
import 'package:flutter_dev_test/src/core/components/custom_text_field.dart';
import 'package:flutter_dev_test/src/core/shared/data/state.dart';
import 'package:flutter_dev_test/src/core/utils/app_colors.dart';
import 'package:flutter_dev_test/src/modules/login/bloc/login_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  final LoginBloc bloc = Modular.get<LoginBloc>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is ErrorState) {
            final snackBar = SnackBar(
              content: Text(state.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/img/login_background_vector.svg',
                    height: 222,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/img/login_background_image.png',
                      height: 222,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomTextField(
                hint: 'E-mail',
                fontColor: AppColors.grey,
                onChanged: (value) {
                  //TODO
                  //No Figma temos esse campo classificado como E-Mail, mas na API é username.
                  bloc.username = value;
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hint: 'Senha',
                fontColor: AppColors.grey,
                obscureText: true,
                onChanged: (value) {
                  bloc.password = value;
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                label: 'Entrar',
                onPressed: bloc.login,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: bloc.recoverPassword,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Esqueci a senha",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
