import 'package:flutter/material.dart';
import 'package:flutter_provider/src/constants/app_image_constants.dart';
import 'package:flutter_provider/src/providers/login_provider/login_provider.dart';
import 'package:flutter_provider/src/widget/mu_outline_button.dart';
import 'package:flutter_provider/src/widget/my_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your mobile number',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                MyTextField(
                  controller: context
                      .read<LoginProvider>()
                      .phoneNumberController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your password',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                MyTextField(
                  controller: context.watch<LoginProvider>().passwordController,
                  isPassword: context.watch<LoginProvider>().isPassWordVisible,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    onPressed: () => context
                        .read<LoginProvider>()
                        .passwordVisibilityChange(),
                    icon: Icon(
                      context.watch<LoginProvider>().isPassWordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      alignment: Alignment.center,
                    ),
                    child: Text(
                      'forgot password?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                MyOutlineButton(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'or',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                MyOutlineButton(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  child: Row(
                    spacing: 20,
                    children: [
                      Spacer(),
                      SvgPicture.asset(
                        AppImageConstants.googleLogo,
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        "Continue with Google",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 12),
                MyOutlineButton(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  child: Row(
                    spacing: 20,
                    children: [
                      Spacer(),
                      SvgPicture.asset(
                        AppImageConstants.appleLogo,
                        height: 24,
                        width: 24,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      Text(
                        "Continue with Apple",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
