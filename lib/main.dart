import 'package:books_app/blocs/settings/app_settings_bloc.dart';
import 'package:books_app/generated/app_localizations.dart';
import 'package:books_app/l10n/l10n.dart';
import 'package:books_app/utils/app_palette.dart';
import 'package:books_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => AppSettingsBloc()..add(InitAppSettings()))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
        builder: (context, state) {
      AppTheme? _appTheme;
      if (state is ThemeState) {
        _appTheme = state.appTheme;
      }

      Locale? _locale;
      if (state is LocaleState) {
        _locale = state.locale;
      }

      return MaterialApp(
        title: AppConstants.appName,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale ?? const Locale('ru'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppPalette.themeData[_appTheme] ??
            AppPalette.themeData[AppTheme.darkBlueTheme],
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
            builder: (context, state) {
          AppTheme? _appTheme;
          if (state is ThemeState) {
            _appTheme = state.appTheme;
          }

          Locale? _locale;
          if (state is LocaleState) {
            _locale = state.locale;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)?.sign_in ?? ''),
              _buildLocaleBtn(Locale('en'), _locale, "English"),
              _buildLocaleBtn(Locale('ru'), _locale, "Русский"),
              _buildThemeButton(
                  AppTheme.lightBlueTheme, _appTheme, 'Light Blue'),
              _buildThemeButton(AppTheme.darkBlueTheme, _appTheme, 'Dark Blue'),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildLocaleBtn(Locale locale, Locale? currentLocale, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<Locale>(
          activeColor: Theme.of(context).colorScheme.secondary,
          groupValue: currentLocale,
          value: locale,
          onChanged: (Locale? locale) {
            BlocProvider.of<AppSettingsBloc>(context).add(ChangeLocale(locale));
          },
        )
      ],
    );
  }

  Widget _buildThemeButton(
      AppTheme theme, AppTheme? currentTheme, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<AppTheme>(
          activeColor: Theme.of(context).colorScheme.secondary,
          groupValue: currentTheme,
          value: theme,
          onChanged: (AppTheme? _theme) {
            BlocProvider.of<AppSettingsBloc>(context).add(ToogleTheme(_theme));
          },
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
        )
      ],
    );
  }
}
