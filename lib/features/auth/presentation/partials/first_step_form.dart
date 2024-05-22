import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/others/app_snackbar.dart';
import '../../domain/params/subscription_params.dart';
import '../bloc/authentication_bloc.dart';

class FirstStepForm extends StatefulWidget {
  const FirstStepForm({super.key});

  @override
  State<FirstStepForm> createState() => _FirstStepFormState();
}

class _FirstStepFormState extends State<FirstStepForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _referralIdController = TextEditingController();

  bool showPassword = false;
  bool showConfirmationPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is UnauthenticatedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            myAppSnackBar(
              context: context,
              message: state.message,
              backgroundColor: AppColor.red1,
            ),
          );
        } else if(state is AuthenticatedState) {
          context.push(Routes.subscriptionSecondStep);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _emailController,
              validator: isEmail,
              label: 'Adresse email',
              backgroundColor: Colors.transparent,
              borderRadius: 0,
              prefixIcon: const Icon(
                Icons.email,
                color: AppColor.white1,
              ),
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _phoneController,
              validator: isPhoneNumber,
              label: 'Téléphone',
              backgroundColor: Colors.transparent,
              keyboardType: TextInputType.phone,
              borderRadius: 0,
              prefixIcon: const Icon(
                Icons.phone,
                color: AppColor.white1,
              ),
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _fullNameController,
              validator: isRequired,
              label: 'Nom de l\'utilisateur',
              backgroundColor: Colors.transparent,
              borderRadius: 0,
              prefixIcon: const Icon(
                Icons.person,
                color: AppColor.white1,
              ),
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _passwordController,
              validator: isRequired,
              label: 'Mot de passe',
              backgroundColor: Colors.transparent,
              obscureText: !showPassword,
              borderRadius: 0,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColor.white1,
              ),
              suffixIcon: InkWell(
                onTap: () => setState(() => showPassword = !showPassword),
                child: Icon(
                  showPassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                  color: AppColor.white1,
                ),
              ),
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _passwordConfirmationController,
              validator: (value) =>
                  isTheSamePassword(_passwordController.text, value ?? ''),
              label: 'Confirmer le Mot de passe',
              backgroundColor: Colors.transparent,
              obscureText: !showConfirmationPassword,
              borderRadius: 0,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColor.white1,
              ),
              suffixIcon: InkWell(
                onTap: () => setState(() => showConfirmationPassword = !showConfirmationPassword),
                child: Icon(
                  showConfirmationPassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                  color: AppColor.white1,
                ),
              ),
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _referralIdController,
              label: 'ID Parrain',
              backgroundColor: Colors.transparent,
              borderRadius: 0,
              prefixIcon: const Icon(
                Icons.person,
                color: AppColor.white1,
              ),
            ),
            const Gap(30),
            FractionallySizedBox(
              widthFactor: 0.4,
              child: CustomElevatedButton(
                onPressed: _sendData,
                borderRadius: 35,
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if(state is LoadingState) {
                      return const SpinKitWave(
                        color: AppColor.green1,
                        size: 25,
                      );
                    }
                    return Text(
                      'S\'inscrire',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor.green1,
                            fontWeight: FontWeight.w700,
                          ),
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendData() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationBloc>().add(
            SubscribeEvent(
              newUser: SubscriptionParams(
                fullName: _fullNameController.text,
                email: _emailController.text,
                phone: _phoneController.text,
                password: _passwordController.text,
                referralcode: _referralIdController.text,
              ),
            ),
          );
    }
  }
}
