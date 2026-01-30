// lib/authentication/presentation/pages/login_page.dart
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../armory/presentation/bloc/armory_bloc.dart';
import '../../../../armory/presentation/bloc/armory_event.dart';
import '../../../../user_dashboard/pages/main_app_page.dart';
import '../bloc/auth_bloc.dart';
import 'forgot_password_page.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        // Only listen to states related to login operation
        // This prevents this page from reacting to other auth operations like signup, reset password, etc.
        return current.maybeMap(
          loading: (l) => l.type == LoadingType.login,
          authenticated: (_) => true, // Always listen to authenticated
          error: (_) {
            // Only listen to errors that came after a login loading state
            return previous.maybeMap(
              loading: (l) => l.type == LoadingType.login,
              orElse: () => false,
            );
          },
          orElse: () => false,
        );
      },
      listener: (context, state) {
        print("🔵 LOGIN PAGE - Current state: $state");
        state.maybeMap(
          authenticated: (s) {
            print("✅ LOGIN SUCCESS - Navigating to MainAppPage");
            BotToast.closeAllLoading();

            // Trigger sync remote to local after successful login
            final userId = locator<LocalStorageService>().userId;
            if (userId != null) {
              context.read<ArmoryBloc>().add(SyncRemoteToLocalEvent(userId: userId));
            }

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainAppPage()),
            );
          },
          error: (s) {
            print("❌ LOGIN ERROR - Message: ${s.message}");
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
            print("🟡 LOGIN PAGE - Other state: ${state.toString()}");
          },
        );
      },
      builder: (context, state) {
        // Show loading in builder instead of listener
        final isLoading = state.maybeMap(
          loading: (l) => l.type == LoadingType.login,
          orElse: () => false,
        );

        if (isLoading) {
          print("⏳ LOGIN - Showing loading in builder");
          BotToast.showLoading();
        }

        return Center(
        child: SingleChildScrollView(
          padding: AppTheme.paddingLarge,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Container(
              decoration: AppTheme.cardDecoration(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(),
                  _buildForm(),
                  _buildActions(),
                ],
              ),
            ),
          ),
        ),
      );
      },
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
          Text('Welcome Back', style: AppTheme.headingMedium(context)),
          const SizedBox(height: 4),
          Text(
            'Sign in to continue to PulseAim',
            style: AppTheme.labelMedium(context),
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
            const SizedBox(height: AppTheme.spacingLarge),
            _buildPasswordField(),
            const SizedBox(height: AppTheme.spacingXXLarge),
            _buildLoginButton(),
            const SizedBox(height: AppTheme.spacingLarge),
            // _buildDivider(),
            // const SizedBox(height: AppTheme.spacingLarge),
            // _buildGoogleButton(),
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

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Password', style: AppTheme.labelMedium(context)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ForgotPasswordPage()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.primary(context),
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Forgot?'),
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: AppTheme.labelMedium(context),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppTheme.textSecondary(context),
                size: AppTheme.iconMedium,
              ),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
          validator: (value) {
            if (value?.trim().isEmpty ?? true) return 'Password is required';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleLogin,
        child: const Text('Sign In'),
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      padding: AppTheme.paddingLarge,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppTheme.border(context))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? ", style: AppTheme.labelMedium(context)),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SignupPage()),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.primary(context),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      AuthEvent.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }
}
