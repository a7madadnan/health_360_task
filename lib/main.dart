import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health_360_task/core/shared_providers/shared_preferences_provider.dart';
import 'package:health_360_task/features/notes/view/notes_home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child: const ProviderScope(child: MainApp())),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.read(noteSharefPreferenceProvider).load();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const NotesHomePage());
  }
}
