import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../user_dashboard/pages/main_app_page.dart';
import '../bloc/auth_bloc.dart';
import 'reset_password_page.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({
    super.key,
    this.isFromForgotPassword = false,
    required this.email,
  });
  final bool isFromForgotPassword;
  final String email;

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  int _resendTimer = 30;
  bool _canResend = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    setState(() {
      _resendTimer = 30;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() => _resendTimer--);
      } else {
        setState(() => _canResend = true);
        timer.cancel();
      }
    });
  }

  void _handleResendCode() {
    if (!_canResend) return;
    context.read<AuthBloc>().add(
      AuthEvent.resendOtp(email: widget.email),
    );
    _startResendTimer();
  }

  void _handleVerification() {
    if (!_formKey.currentState!.validate()) return;

    if (widget.isFromForgotPassword) {
      context.read<AuthBloc>().add(
        AuthEvent.verifyResetToken(token: _otpController.text.trim()),
      );
    } else {
      context.read<AuthBloc>().add(
        AuthEvent.verifyEmail(token: _otpController.text.trim()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isFromForgotPassword ? 'Verify Reset Code' : 'Verify Email'),
        backgroundColor: AppTheme.primary(context),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppTheme.background(context),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          // Only listen to states related to email verification operations
          return current.maybeMap(
            loading: (l) => l.type == LoadingType.verifyEmail ||
                           l.type == LoadingType.verifyResetToken ||
                           l.type == LoadingType.resendOtp,
            resetTokenVerified: (_) => true,
            emailVerified: (_) => true,
            otpResent: (_) => true,
            error: (_) {
              // Only listen to errors from email verification operations
              return previous.maybeMap(
                loading: (l) => l.type == LoadingType.verifyEmail ||
                               l.type == LoadingType.verifyResetToken ||
                               l.type == LoadingType.resendOtp,
                orElse: () => false,
              );
            },
            orElse: () => false,
          );
        },
        listener: (context, state) {
          print("🔵 EMAIL VERIFICATION PAGE - Current state: $state");
          state.maybeMap(
            loading: (l) {
              if (l.type == LoadingType.verifyEmail ||
                  l.type == LoadingType.verifyResetToken ||
                  l.type == LoadingType.resendOtp) {
                print("⏳ EMAIL VERIFICATION - Showing loading");
                BotToast.showLoading();
              }
            },
            resetTokenVerified: (s) {
              print("✅ RESET TOKEN VERIFIED - Navigating to reset password");
              BotToast.closeAllLoading();
              Toast.show(
                context,
                message: s.message,
                icon: Icon(Icons.check_circle_outline, color: AppColors.white),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResetPasswordPage(email: widget.email),
                ),
              );
            },
            emailVerified: (s) {
              print("✅ EMAIL VERIFIED - Navigating to main app");
              BotToast.closeAllLoading();
              Toast.show(
                context,
                message: s.message,
                icon: Icon(Icons.check_circle_outline, color: AppColors.white),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainAppPage()),
              );
            },
            otpResent: (s) {
              print("✅ OTP RESENT");
              BotToast.closeAllLoading();
              Toast.show(
                context,
                message: s.message,
                icon: Icon(Icons.check_circle_outline, color: AppColors.white),
              );
            },
            error: (s) {
              print("❌ EMAIL VERIFICATION ERROR - Message: ${s.message}");
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
                child: Padding(
                  padding: AppTheme.paddingLarge,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.isFromForgotPassword
                              ? 'Verify Reset Code'
                              : 'Verify Your Email',
                          style: AppTheme.headingMedium(context),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.isFromForgotPassword
                              ? 'Enter the verification code sent to ${widget.email}'
                              : 'We sent a verification code to ${widget.email}',
                          style: AppTheme.labelMedium(context),
                        ),
                        const SizedBox(height: AppTheme.spacingXXLarge),
                        Text('Verification Code', style: AppTheme.labelMedium(context)),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
                          decoration: InputDecoration(
                            hintText: 'Enter 4-digit code',
                            hintStyle: AppTheme.labelMedium(context),
                            counterText: '',
                          ),
                          validator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Verification code is required';
                            }
                            if (value!.length != 4) {
                              return 'Code must be 4 digits';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppTheme.spacingLarge),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Didn't receive code?",
                              style: AppTheme.labelMedium(context),
                            ),
                            TextButton(
                              onPressed: _canResend ? _handleResendCode : null,
                              child: Text(
                                _canResend
                                    ? 'Resend Code'
                                    : 'Resend in ${_resendTimer}s',
                                style: TextStyle(
                                  color: _canResend
                                      ? AppTheme.primary(context)
                                      : AppTheme.textSecondary(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppTheme.spacingXXLarge),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleVerification,
                            child: const Text('Verify'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
