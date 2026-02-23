// lib/src/features/auth_new/authentication/presentation/pages/login_page.dart - UPDATE constraints
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app%20config/device_config.dart';
import '../../navigation/auth_route.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../armory/presentation/bloc/armory_bloc.dart';
import '../../../../armory/presentation/bloc/armory_event.dart';
import '../../../../user_dashboard/pages/main_app_page.dart';
import '../widgets/common_signin_form.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/pulse_id_button.dart';
import 'forgot_password_page.dart';
import 'pulse_id_auth_page.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceConfig.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        return current.maybeMap(
          loading: (l) => l.type == LoadingType.login,
          authenticated: (_) => true,
          error: (_) {
            return previous.maybeMap(
              loading: (l) => l.type == LoadingType.login,
              orElse: () => false,
            );
          },
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeMap(
          authenticated: (s) {
            BotToast.closeAllLoading();
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
      builder: (context, state) {
        final isLoading = state.maybeMap(
          loading: (l) => l.type == LoadingType.login,
          orElse: () => false,
        );

        if (isLoading) {
          BotToast.showLoading();
        }

        return Center(
          child: SingleChildScrollView(
            padding: AppTheme.paddingLarge,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : screenWidth * 0.5),
              child: Container(
                decoration: AppTheme.cardDecoration(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(),
                    _buildPulseIdButton(),
                    _buildDivider(),
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
          const SizedBox(height: AppTheme.spacingXSmall),
          Text('Sign in to continue to PulseAim', style: AppTheme.labelMedium(context)),
        ],
      ),
    );
  }

  Widget _buildPulseIdButton() {
    return Padding(
      padding: AppTheme.paddingLarge,
      child: PulseIdButton(
        onPressed: () {
          Navigator.push(
            context,
              AuthRoute(builder: (_) => const PulseIdAuthPage())
          );
        },
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: AppTheme.paddingHorizontalLarge,
      child: Row(
        children: [
          Expanded(child: Divider(color: AppTheme.border(context))),
          Padding(
            padding: AppTheme.paddingHorizontalLarge,
            child: Text('OR', style: AppTheme.labelMedium(context)),
          ),
          Expanded(child: Divider(color: AppTheme.border(context))),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: AppTheme.paddingLarge,
      child: CommonSignInForm(
        formKey: _formKey,
        emailController: _emailController,
        passwordController: _passwordController,
        onForgotPassword: () {
          Navigator.push(
            context,
              AuthRoute(builder: (_) => const ForgotPasswordPage())
          );
        },
        onSubmit: _handleLogin,
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
                  AuthRoute(builder: (_) => const SignupPage())
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