import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/src/core/components/custom_button.dart';
import 'package:flutter_dev_test/src/core/shared/model/error/error_handler.dart';
import 'package:flutter_dev_test/src/core/utils/app_colors.dart';
import 'package:flutter_dev_test/src/modules/recover/bloc/recover_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class RecoverPage extends StatelessWidget {
  const RecoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.brown,
          size: 24,
        ),
      ),
      body: BlocProvider(
        create: (_) => RecoverBloc(),
        child: BlocBuilder<RecoverBloc, String>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Verificação',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey_darken,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'Insira o código que foi enviado:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey_medium2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  FittedBox(
                    child: OtpTextField(
                      borderColor: AppColors.grey_medium,
                      borderWidth: 1.5,
                      fieldHeight: 52,
                      fieldWidth: 54,
                      enabledBorderColor: AppColors.grey_medium,
                      showFieldAsBox: true,
                      numberOfFields: 6,
                      borderRadius: BorderRadius.circular(5),
                      focusedBorderColor: AppColors.brown,
                      autoFocus: true,
                      onCodeChanged: (value) {
                        ReadContext(context).read<RecoverBloc>().setOTP('');
                      },
                      onSubmit: (value) {
                        ReadContext(context).read<RecoverBloc>().setOTP(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    label: 'Confirmar',
                    disabled: state.length != 6,
                    onPressed: () async {
                      var result = await ReadContext(context).read<RecoverBloc>().sendOTP();
                      if (result is ErrorHandler) {
                        SnackBar snackBar = SnackBar(
                          content: Text(result.message),
                        );
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  const Text('Não recebi o código'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
