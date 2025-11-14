import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/core/enum/session_enum.dart';
import 'package:pa_sreens/core/routes/app_pages.dart';
import 'package:pa_sreens/core/routes/locatore.dart';
import 'package:pa_sreens/core/routes/routes_services.dart';
import 'package:pa_sreens/core/theme/app_theme.dart';
import 'package:pa_sreens/training/presentation/bloc/training_event.dart';
import '../../../../core/routes/app_routes.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_state.dart';

class TrainingLayoutView extends StatefulWidget {
  static const routeName = '/training-layout';
  const TrainingLayoutView({super.key});

  @override
  State<TrainingLayoutView> createState() => _TrainingLayoutViewState();
}

class _TrainingLayoutViewState extends State<TrainingLayoutView> {
  TrainingBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = BlocProvider.of<TrainingBloc>(context);
  }

  @override
  void initState() {
    super.initState();
    const lightSystemIconsStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(lightSystemIconsStyle);
  }

  void _handleNavigation(SessionPage page, String route, bool isDisabled) {
    if (isDisabled || _bloc == null) return;
    _bloc!.add(NavigateToEvent(page, route));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted &&
          locator<RoutesService>().navigatorKey.currentState?.mounted == true) {
        locator<RoutesService>().navigateTo(route);
      }
    });
  }

  List<Map<String, dynamic>> _getSections() {
    return [
      {
        'title': 'Session Setup',
        'icon': Icons.settings,
        'page': SessionPage.setup,
        'route': AppRoutes.setupView,
      },
      {
        'title': 'Preview & Configure',
        'icon': Icons.list_alt,
        'page': SessionPage.preview,
        'route': AppRoutes.previewView,
      },
      {
        'title': 'Start Session',
        'icon': Icons.play_arrow,
        'page': SessionPage.active,
        'route': AppRoutes.activeView,
      },
    ];
  }

  Widget _buildSideBar(TrainingState state) {
    final sections = _getSections();

    return Container(
      width: 280,
      color: AppTheme.background(context),
      child: ListView(
        padding: const EdgeInsets.only(top: 30),
        children: sections.map((sec) {
          final page = sec['page'] as SessionPage;
          final icon = sec['icon'] as IconData;
          final title = sec['title'] as String;
          final route = sec['route'] as String;

          final isActive = state.currentPage == page;
          final isCompleted = state.isStepCompleted(page);
          final isDisabled = !state.isAllowed(page);

          return _SidebarTile(
            title: title,
            icon: icon,
            isActive: isActive,
            isCompleted: isCompleted,
            isDisabled: isDisabled,
            onTap: () => _handleNavigation(page, route, isDisabled),
          );
        }).toList(),
      ),
    );
  }

  /// AppBar for phones
  PreferredSizeWidget _buildAppBar(TrainingState state) {
    final sections = _getSections();

    return AppBar(
      title: const Text('Training Session'),
      backgroundColor: AppTheme.primary(context),
      actions: sections.map((sec) {
        final page = sec['page'] as SessionPage;
        final icon = sec['icon'] as IconData;
        final title = sec['title'] as String;
        final route = sec['route'] as String;
        final isDisabled = !state.isAllowed(page);

        return IconButton(
          tooltip: title,
          icon: Icon(
            icon,
            color: isDisabled
                ? Colors.white.withOpacity(0.4)
                : Colors.white,
          ),
          onPressed:
              isDisabled ? null : () => _handleNavigation(page, route, isDisabled),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.of(context).size.width < 600;

    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        final body = Container(
          decoration: BoxDecoration(
            color: AppTheme.background(context),
            border: isPhone
                ? null
                : Border(
                    left: BorderSide(
                      color: AppTheme.primary(context).withOpacity(0.2),
                    ),
                  ),
          ),
          child: Navigator(
            key: locator<RoutesService>().navigatorKey,
            initialRoute: AppRoutes.setupView,
            clipBehavior: Clip.none,
            onGenerateRoute: AppPages.onGenerateRoute,
          ),
        );

        return Scaffold(
          backgroundColor: AppTheme.background(context),
          appBar: isPhone ? _buildAppBar(state) : null,
          body: isPhone
              ? body
              : Row(
                  children: [
                    _buildSideBar(state),
                    Expanded(child: body),
                  ],
                ),
        );
      },
    );
  }
}

class _SidebarTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final bool isCompleted;
  final bool isDisabled;
  final VoidCallback? onTap;

  const _SidebarTile({
    required this.title,
    required this.icon,
    required this.isActive,
    required this.isCompleted,
    required this.isDisabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive
              ? AppTheme.primary(context).withOpacity(0.2)
              : AppTheme.background(context),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive
                ? AppTheme.primary(context).withOpacity(0.2)
                : AppTheme.background(context),
          ),
          boxShadow: [
            if (isActive)
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          onTap: isDisabled ? null : onTap,
          leading: Icon(icon, color: AppTheme.textPrimary(context)),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary(context),
              fontSize: 16,
            ),
          ),
          trailing: isCompleted
              ? Icon(Icons.check_circle, color: AppTheme.primary(context))
              : (isDisabled
                  ? const Icon(Icons.lock_outline, color: Colors.grey)
                  : null),
        ),
      ),
    );
  }
}
