import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/toast.dart';
import '../bloc/auth_bloc.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleResetPassword() {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Passwords do not match'),
          backgroundColor: AppTheme.error(context),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    context.read<AuthBloc>().add(
      AuthEvent.resetPassword(
        email: widget.email,
        newPassword: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        backgroundColor: AppTheme.primary(context),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppTheme.background(context),

      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          // Only listen to states related to resetPassword operation
          return current.maybeMap(
            loading: (l) => l.type == LoadingType.resetPassword,
            passwordReset: (_) => true,
            error: (_) {
              // Only listen to errors that came after a resetPassword loading state
              return previous.maybeMap(
                loading: (l) => l.type == LoadingType.resetPassword,
                orElse: () => false,
              );
            },
            orElse: () => false,
          );
        },
        listener: (context, state) {
          print("🔵 RESET PASSWORD PAGE - Current state: $state");
          state.maybeMap(
            loading: (l) {
              if (l.type == LoadingType.resetPassword) {
                print("⏳ RESET PASSWORD - Showing loading");
                BotToast.showLoading();
              }
            },
            passwordReset: (s) {
              print("✅ PASSWORD RESET - Navigating to login");
              BotToast.closeAllLoading();
              Toast.show(
                context,
                message: s.message,
                icon: Icon(Icons.check_circle_outline, color: AppColors.white),
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            error: (s) {
              print("❌ RESET PASSWORD ERROR - Message: ${s.message}");
              BotToast.closeAllLoading();
              Toast.show(
                context,
                message: s.message,
                icon: Icon(
                  s.isNetworkError ? Icons.wifi_off : Icons.error_outline,
                  color: AppColors.white,
                ),
              );
            },
            orElse: () {
              BotToast.closeAllLoading();
            },
          );
        },
        child: _buildResetPasswordForm(),
      ),
    );
  }

  Widget _buildResetPasswordForm() {
    return Center(
      child: SingleChildScrollView(
        padding: AppTheme.paddingLarge,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Container(
            decoration: AppTheme.cardDecoration(context),
            child: Padding(
              padding: AppTheme.paddingLarge,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Password', style: AppTheme.labelMedium(context)),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter new password',
                        hintStyle: AppTheme.labelMedium(context),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: AppTheme.textSecondary(context),
                            size: AppTheme.iconMedium,
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) return 'Password is required';
                        if (value!.length < 8) return 'Password must be at least 8 characters';
                        return null;
                      },
                    ),
                    const SizedBox(height: AppTheme.spacingLarge),
                    Text('Confirm Password', style: AppTheme.labelMedium(context)),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
                      decoration: InputDecoration(
                        hintText: 'Confirm new password',
                        hintStyle: AppTheme.labelMedium(context),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                            color: AppTheme.textSecondary(context),
                            size: AppTheme.iconMedium,
                          ),
                          onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                        ),
                      ),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) return 'Please confirm your password';
                        if (value != _passwordController.text) return 'Passwords do not match';
                        return null;
                      },
                    ),
                    const SizedBox(height: AppTheme.spacingXXLarge),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _handleResetPassword,
                        child: const Text('Reset Password'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
