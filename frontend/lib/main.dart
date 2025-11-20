//import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart' as foundation;
import "package:flutter/services.dart";
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/view/home.dart';

void main() {
  if (foundation.kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    BrowserContextMenu.disableContextMenu();
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onExitRequested: () async {
        return AppExitResponse.exit;
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Authority Editor',
      home: const HomePage(),
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange,
      ),
    );
  }
}
