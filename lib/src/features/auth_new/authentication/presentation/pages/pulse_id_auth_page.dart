// lib/src/features/auth_new/authentication/presentation/pages/pulse_id_auth_page.dart
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/src/core/app%20config/device_config.dart';
import 'package:pa_sreens/src/core/widgets/toast.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/widgets/common_signin_form.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/widgets/common_signup_form.dart';
import '../../navigation/auth_route.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/header_with_back_button.dart';
import 'email_verification_page.dart';
import 'forgot_password_page.dart';

class PulseIdAuthPage extends StatefulWidget {
  const PulseIdAuthPage({super.key});

  @override
  State<PulseIdAuthPage> createState() => _PulseIdAuthPageState();
}

class _PulseIdAuthPageState extends State<PulseIdAuthPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceConfig.isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenHeight * 0.04;
    final logoSize = screenHeight * 0.06;

    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: AppTheme.paddingLarge,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : screenWidth * 0.8),
              child: Container(
                decoration: AppTheme.cardDecoration(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: AppTheme.paddingLarge,
                      child: Column(
                        children: [
                          HeaderWithBackButton(
                            child: Container(
                              width: logoSize,
                              height: logoSize,
                              padding: EdgeInsets.all(logoSize * 0.2),
                              decoration: BoxDecoration(
                                color: AppTheme.primary(context),
                                borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                              ),
                              child: Icon(
                                Icons.access_time_rounded,
                                color: AppTheme.surface(context),
                                size: iconSize,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppTheme.spacingMedium),
                          Text('Pulse ID', style: AppTheme.headingMedium(context)),
                          const SizedBox(height: AppTheme.spacingXSmall),
                          Text('Your universal identity', style: AppTheme.labelSmall(context)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppTheme.paddingHorizontalLarge,
                      child: Container(
                        padding: AppTheme.paddingMedium,
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceVariant(context),
                          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: AppTheme.iconMedium,
                              height: AppTheme.iconMedium,
                              decoration: BoxDecoration(
                                color: AppTheme.primary(context),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: AppTheme.surface(context),
                                size: AppTheme.iconSmall - 2,
                              ),
                            ),
                            const SizedBox(width: AppTheme.spacingSmall),
                            AnimatedBuilder(
                              animation: _tabController,
                              builder: (_, __) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _tabController.index == 0 ? 'Signing in to ' : 'Signing up to ',
                                    style: AppTheme.bodySmall(context),
                                  ),
                                  Text(
                                    'PulseAim',
                                    style: AppTheme.bodySmall(context).copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingLarge),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppTheme.border(context)),
                          bottom: BorderSide(color: AppTheme.border(context)),
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: AppTheme.primary(context),
                        unselectedLabelColor: AppTheme.textSecondary(context),
                        indicatorColor: AppTheme.primary(context),
                        labelStyle: AppTheme.titleSmall(context),
                        tabs: const [
                          Tab(text: 'Sign In'),
                          Tab(text: 'Create Account'),
                        ],
                      ),
                    ),
              AnimatedBuilder(
              animation: _tabController.animation!,
                builder: (context, child) {
                  final t = _tabController.animation!.value.clamp(0.0, 1.0);

                  final tabHeight = isMobile
                      ? (lerpDouble(screenHeight * 0.4, screenHeight * 0.65, t) ??
                      screenHeight * 0.4)
                      : screenHeight * 0.5;



                  final delta = (t - t.roundToDouble()).abs();        // 0 at ends, ~0.5 mid
                  final endP = 1.0 - (delta * 2.0).clamp(0.0, 1.0);   // 0 mid, 1 at ends
                  final delayed = ((endP - 0.35) / 0.65).clamp(0.0, 1.0);
                  final opacity = isMobile ? Curves.easeOut.transform(delayed) : 1.0;

                  return SizedBox(
                    height: tabHeight,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOut,
                      opacity: opacity,
                      child: IgnorePointer(
                        ignoring: isMobile && opacity < 0.9,
                        child: child,
                      ),
                    ),
                  );
                },
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _SignInTab(isMobile: isMobile),
                    _CreateAccountTab(isMobile: isMobile),
                  ],
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

class _SignInTab extends StatefulWidget {
  final bool isMobile;

  const _SignInTab({required this.isMobile});

  @override
  State<_SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<_SignInTab> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current.maybeMap(
        loading: (l) => l.type == LoadingType.login,
        authenticated: (_) => true,
        error: (_) => previous.maybeMap(
          loading: (l) => l.type == LoadingType.login,
          orElse: () => false,
        ),
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeMap(
          loading: (l) {
            if (l.type == LoadingType.login) BotToast.showLoading();
          },
          authenticated: (_) {
            BotToast.closeAllLoading();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          error: (s) {
            BotToast.closeAllLoading();
            Toast.show(
              context,
              message: s.message,
              icon: Icon(
                s.isNetworkError ? Icons.wifi_off : Icons.error_outline,
                color: AppTheme.surface(context),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
        padding: AppTheme.paddingLarge,
        child: CommonSignInForm(
          formKey: _formKey,
          emailController: _emailController,
          passwordController: _passwordController,
          onForgotPassword: () => Navigator.push(
            context,
              AuthRoute(builder: (_) => const ForgotPasswordPage())
          ),
          onSubmit: () {
            if (!_formKey.currentState!.validate()) return;
            context.read<AuthBloc>().add(
              AuthEvent.login(
                email: _emailController.text.trim(),
                password: _passwordController.text,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateAccountTab extends StatefulWidget {
  final bool isMobile;

  const _CreateAccountTab({required this.isMobile});

  @override
  State<_CreateAccountTab> createState() => _CreateAccountTabState();
}

class _CreateAccountTabState extends State<_CreateAccountTab> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current.maybeMap(
        loading: (l) => l.type == LoadingType.signup,
        signupSuccess: (_) => true,
        error: (_) => previous.maybeMap(
          loading: (l) => l.type == LoadingType.signup,
          orElse: () => false,
        ),
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeMap(
          loading: (l) {
            if (l.type == LoadingType.signup) BotToast.showLoading();
          },
          signupSuccess: (_) {
            BotToast.closeAllLoading();
            Toast.show(
              context,
              message: 'Account created! Please verify your email.',
              icon: Icon(Icons.check_circle_outline, color: AppTheme.surface(context)),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => EmailVerificationPage(email: _emailController.text.trim()),
              ),
            );
          },
          error: (s) {
            BotToast.closeAllLoading();
            Toast.show(
              context,
              message: s.message,
              icon: Icon(
                s.isNetworkError ? Icons.wifi_off : Icons.error_outline,
                color: AppTheme.surface(context),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
        padding: AppTheme.paddingLarge,
        child: CommonSignUpForm(
          formKey: _formKey,
          emailController: _emailController,
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController,
          useRowLayout: !widget.isMobile,
          onSubmit: () {
            if (!_formKey.currentState!.validate()) return;
            context.read<AuthBloc>().add(
              AuthEvent.signup(
                firstName: _firstNameController.text.trim(),
                lastName: _lastNameController.text.trim(),
                email: _emailController.text.trim(),
                password: _passwordController.text,
              ),
            );
          },
        ),
      ),
    );
  }
}