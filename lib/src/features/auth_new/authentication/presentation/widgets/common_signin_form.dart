// lib/src/features/auth_new/authentication/presentation/widgets/common_signin_form.dart
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/theme_data/theme_data.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/widgets/common_auth_button.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/widgets/common_auth_input_field.dart';

class CommonSignInForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final VoidCallback? onForgotPassword;

  const CommonSignInForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    this.onForgotPassword,
  });

  @override
  State<CommonSignInForm> createState() => _CommonSignInFormState();
}

class _CommonSignInFormState extends State<CommonSignInForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CommonAuthInputField(
            label: 'Email',
            hint: 'Enter your email',
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value?.trim().isEmpty ?? true) return 'Email is required';
              if (!value!.contains('@')) return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: AppTheme.spacingLarge),
          CommonAuthInputField(
            label: 'Password',
            hint: 'Enter your password',
            controller: widget.passwordController,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppTheme.textSecondary(context),
                size: AppTheme.iconMedium,
              ),
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            ),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) return 'Password is required';
              return null;
            },
          ),
          const SizedBox(height: AppTheme.spacingLarge),
          if (widget.onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: widget.onForgotPassword,
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.primary(context),
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Forgot Password?'),
              ),
            ),
          const SizedBox(height: AppTheme.spacingXXLarge),
          CommonAuthButton(
            text: 'Sign In',
            onPressed: widget.onSubmit,
          ),
        ],
      ),
    );
  }
}