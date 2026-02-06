// lib/src/features/auth_new/authentication/presentation/widgets/common_signup_form.dart
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/theme_data/theme_data.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/widgets/common_auth_button.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/widgets/common_auth_input_field.dart';

class CommonSignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSubmit;
  final bool useRowLayout;

  const CommonSignUpForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSubmit,
    this.useRowLayout = false,
  });

  @override
  State<CommonSignUpForm> createState() => _CommonSignUpFormState();
}

class _CommonSignUpFormState extends State<CommonSignUpForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          if (widget.useRowLayout) ...[
            Row(
              children: [
                Expanded(
                  child: CommonAuthInputField(
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
                ),
                const SizedBox(width: AppTheme.spacingLarge),
                Expanded(
                  child: CommonAuthInputField(
                    label: 'Username (Optional)',
                    hint: 'Enter your username',
                    controller: widget.usernameController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingLarge),
            Row(
              children: [
                Expanded(
                  child: CommonAuthInputField(
                    label: 'Password',
                    hint: 'Create password (min. 8 characters)',
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
                      if (value!.length < 8) return 'Password must be at least 8 characters';
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: AppTheme.spacingLarge),
                Expanded(
                  child: CommonAuthInputField(
                    label: 'Confirm Password',
                    hint: 'Confirm your password',
                    controller: widget.confirmPasswordController,
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
                      if (value?.trim().isEmpty ?? true) return 'Confirm password is required';
                      if (value != widget.passwordController.text) return 'Passwords do not match';
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ] else ...[
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
              label: 'Username (Optional)',
              hint: 'Enter your username',
              controller: widget.usernameController,
            ),
            const SizedBox(height: AppTheme.spacingLarge),
            CommonAuthInputField(
              label: 'Password',
              hint: 'Create password (min. 8 characters)',
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
                if (value!.length < 8) return 'Password must be at least 8 characters';
                return null;
              },
            ),
            const SizedBox(height: AppTheme.spacingLarge),
            CommonAuthInputField(
              label: 'Confirm Password',
              hint: 'Confirm your password',
              controller: widget.confirmPasswordController,
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
                if (value?.trim().isEmpty ?? true) return 'Confirm password is required';
                if (value != widget.passwordController.text) return 'Passwords do not match';
                return null;
              },
            ),
          ],
          const SizedBox(height: AppTheme.spacingXXLarge),
          CommonAuthButton(
            text: 'Create Account',
            onPressed: widget.onSubmit,
          ),
        ],
      ),
    );
  }
}