// lib/authentication/presentation/pages/signup_page.dart
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/color/app_colors_new.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/toast.dart';
import '../bloc/auth_bloc.dart';
import 'package:country_picker/country_picker.dart';
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
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _selectedCountry;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        // Only listen to states related to signup operation
        return current.maybeMap(
          loading: (l) => l.type == LoadingType.signup,
          signupSuccess: (_) => true,
          authenticated: (_) => true,
          error: (_) {
            // Only listen to errors from signup operation
            return previous.maybeMap(
              loading: (l) => l.type == LoadingType.signup,
              orElse: () => false,
            );
          },
          orElse: () => false,
        );
      },
      listener: (context, state) {
        print("🔵 SIGNUP PAGE - Current state: $state");
        state.maybeMap(
          loading: (l) {
            if (l.type == LoadingType.signup) {
              print("⏳ SIGNUP - Showing loading");
              BotToast.showLoading();
            }
          },
          signupSuccess: (s) {
            print("✅ SIGNUP SUCCESS - Navigating to email verification");
            BotToast.closeAllLoading();
            Toast.show(
              context,
              message: 'Account created successfully! Please check your email to verify your account.',
              icon: Icon(Icons.check_circle_outline, color: AppColors.white),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EmailVerificationPage(
                  email: _emailController.text.trim(),
                ),
              ),
            );
          },
          authenticated: (s) {
            print("✅ AUTHENTICATED - Returning to root");
            BotToast.closeAllLoading();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          error: (s) {
            print("❌ SIGNUP ERROR - Message: ${s.message}");
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
                children: [_buildHeader(), _buildForm(), _buildActions()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ... rest of the code remains same ...

  Widget _buildHeader() {
    return Container(
      padding: AppTheme.paddingLarge,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.border(context))),
      ),
      child: Column(
        children: [
          Text('Create Account', style: AppTheme.headingMedium(context)),
          const SizedBox(height: 4),
          Text('Join PulseAim today', style: AppTheme.labelMedium(context)),
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
            _buildFirstNameField(),
            const SizedBox(height: AppTheme.spacingLarge),
            _buildPasswordField(),
            const SizedBox(height: AppTheme.spacingLarge),
            _buildConfirmPasswordField(),
            const SizedBox(height: AppTheme.spacingXXLarge),
            _buildSignupButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Username', style: AppTheme.labelMedium(context)),
        const SizedBox(height: 6),
        TextFormField(
          controller: _usernameController,
          style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
          decoration: InputDecoration(
            hintText: 'Enter your username (optional)',
            hintStyle: AppTheme.labelMedium(context),
          ),
          // validator: (value) {
          //   if (value?.trim().isEmpty ?? true) return 'First name is required';
          //   return null;
          // },
        ),
      ],
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
        Text('Password', style: AppTheme.labelMedium(context)),
        const SizedBox(height: 6),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
          decoration: InputDecoration(
            hintText: 'Create a password (min. 8 characters)',
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
            if (value!.length < 8)
              return 'Password must be at least 8 characters';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Confirm Password', style: AppTheme.labelMedium(context)),
        const SizedBox(height: 6),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscurePassword,
          style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
          decoration: InputDecoration(
            hintText: 'Confirm your password',
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
            if (value?.trim().isEmpty ?? true)
              return 'Confirm password is required';
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSignupButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSignup,
        child: const Text('Create Account'),
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
          Text(
            'Already have an account? ',
            style: AppTheme.labelMedium(context),
          ),
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

  void _pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      countryListTheme: CountryListThemeData(
        backgroundColor: AppTheme.surface(context),
        textStyle: AppTheme.bodyMedium(context),
        searchTextStyle: AppTheme.bodyMedium(context),
        inputDecoration: InputDecoration(
          hintText: 'Search country',
          hintStyle: AppTheme.labelMedium(context),
        ),
      ),
      onSelect: (Country country) {
        setState(() => _selectedCountry = country.name);
      },
    );
  }

  void _handleSignup() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      AuthEvent.signup(
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        location: _selectedCountry,
      ),
    );
  }
}
