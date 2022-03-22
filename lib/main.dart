import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:smart_melon_farm/welcom/welcom_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'dashboard/dashboard_widget.dart';
import 'dailycare/dailycare_widget.dart';
import 'setting/setting_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;
  Stream<SmartMelonFarmFirebaseUser> userStream;
  SmartMelonFarmFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  void initState() {
    super.initState();
    userStream = smartMelonFarmFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Melon Farm',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.white,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/Group_465.png',
                  fit: BoxFit.none,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : WelcomWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Login';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Dashboard': DashboardWidget(),
      'Dailycare': DailycareWidget(),
      'Setting': SettingWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF3170DA),
        unselectedItemColor: Color(0xFF535252),
        selectedBackgroundColor: Colors.transparent,
        borderRadius: 8,
        itemBorderRadius: 8,
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        width: double.infinity,
        elevation: 500,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 0 ? Icons.home : Icons.home_outlined,
                  color:
                      currentIndex == 0 ? Color(0xFF3170DA) : Color(0xFF535252),
                  size: 24,
                ),
                Text(
                  'Home',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fact_check_sharp,
                  color:
                      currentIndex == 1 ? Color(0xFF3170DA) : Color(0xFF535252),
                  size: 24,
                ),
                Text(
                  'Daily Care',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 2
                      ? Icons.settings_rounded
                      : Icons.settings_outlined,
                  color:
                      currentIndex == 2 ? Color(0xFF3170DA) : Color(0xFF535252),
                  size: 24,
                ),
                Text(
                  'Setting',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
