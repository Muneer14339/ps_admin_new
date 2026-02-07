import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/toast.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/header_with_back_button.dart';
import 'email_verification_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: const ForgotPasswordForm(),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        // Only listen to states related to sendPasswordReset operation
        return current.maybeMap(
          loading: (l) => l.type == LoadingType.sendPasswordReset,
          passwordResetSent: (_) => true,
          error: (_) {
            // Only listen to errors from sendPasswordReset operation
            return previous.maybeMap(
              loading: (l) => l.type == LoadingType.sendPasswordReset,
              orElse: () => false,
            );
          },
          orElse: () => false,
        );
      },
      listener: (context, state) {
        print("🔵 FORGOT PASSWORD PAGE - Current state: $state");
        state.maybeMap(
          loading: (l) {
            if (l.type == LoadingType.sendPasswordReset) {
              print("⏳ FORGOT PASSWORD - Showing loading");
              BotToast.showLoading();
            }
          },
          passwordResetSent: (s) {
            print("✅ PASSWORD RESET SENT - Navigating to verification");
            BotToast.closeAllLoading();
            Toast.show(
              context,
              message: 'Password reset OTP sent to ${_emailController.text}',
              icon: Icon(Icons.check_circle_outline, color: AppColors.white),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => EmailVerificationPage(
                  isFromForgotPassword: true,
                  email: _emailController.text.trim(),
                ),
              ),
            );
          },
          error: (s) {
            print("❌ FORGOT PASSWORD ERROR - Message: ${s.message}");
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
      child: Center(
        child: SingleChildScrollView(
          padding: AppTheme.paddingLarge,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Container(
              decoration: AppTheme.cardDecoration(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [_buildHeader(), _buildForm()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: AppTheme.paddingLarge,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.border(context))),
      ),
      child: Column(
        children: [
          HeaderWithBackButton(
            child: Text('Reset Password', style: AppTheme.headingMedium(context)),
          ),
          const SizedBox(height: 4),
          Text(
            'Enter your email to receive a password reset OTP',
            style: AppTheme.labelMedium(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: AppTheme.paddingLarge,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildEmailField(),
            const SizedBox(height: AppTheme.spacingXXLarge),
            _buildResetButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: AppTheme.labelMedium(context)),
        const SizedBox(height: 6),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
          decoration: InputDecoration(
            hintText: 'Enter your email',
            hintStyle: AppTheme.labelMedium(context),
          ),
          validator: (value) {
            if (value?.trim().isEmpty ?? true) return 'Email is required';
            if (!value!.contains('@')) return 'Enter a valid email';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildResetButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleReset,
        child: const Text('Send OTP'),
      ),
    );
  }

  void _handleReset() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      AuthEvent.sendPasswordReset(email: _emailController.text.trim()),
    );
  }
}
