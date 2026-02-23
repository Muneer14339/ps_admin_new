// lib/src/features/auth_new/authentication/presentation/pages/signup_page.dart - UPDATE constraints
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app%20config/device_config.dart';
import '../../navigation/auth_route.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/toast.dart';
import '../widgets/common_signup_form.dart';
import '../bloc/auth_bloc.dart';
import 'email_verification_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: const SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
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
    final isMobile = DeviceConfig.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        return current.maybeMap(
          loading: (l) => l.type == LoadingType.signup,
          signupSuccess: (_) => true,
          authenticated: (_) => true,
          error: (_) {
            return previous.maybeMap(
              loading: (l) => l.type == LoadingType.signup,
              orElse: () => false,
            );
          },
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeMap(
          loading: (l) {
            if (l.type == LoadingType.signup) {
              BotToast.showLoading();
            }
          },
          signupSuccess: (s) {
            BotToast.closeAllLoading();
            Toast.show(
              context,
              message: 'Account created successfully! Please check your email to verify your account.',
              icon: Icon(Icons.check_circle_outline, color: AppTheme.surface(context)),
            );
            Navigator.pushReplacement(
              context,
              AuthRoute(builder: (_) => EmailVerificationPage(
                  email: _emailController.text.trim(),
                ),
              ),
            );
          },
          authenticated: (s) {
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
          orElse: () {
            BotToast.closeAllLoading();
          },
        );
      },
      child: Center(
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
                  _buildForm(),
                  _buildActions(),
                ],
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
          Text('Create Account', style: AppTheme.headingMedium(context)),
          const SizedBox(height: AppTheme.spacingXSmall),
          Text('Join PulseAim today', style: AppTheme.labelMedium(context)),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: AppTheme.paddingLarge,
      child: CommonSignUpForm(
        formKey: _formKey,
        emailController: _emailController,
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
        onSubmit: _handleSignup,
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
          Text('Already have an account? ', style: AppTheme.labelMedium(context)),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.primary(context),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }

  void _handleSignup() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      AuthEvent.signup(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }
}