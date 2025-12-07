import 'dart:io';
import 'dart:ui';
import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart' as foundation;
import "package:flutter/services.dart";
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/view/home.dart';
import 'package:authorityeditor/authority/authority.dart' show outputDir;

final log = Logger('AuthorityEditor');

void main() async {
  if (foundation.kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    BrowserContextMenu.disableContextMenu();
  } else {
    Directory dir;
    try {
      dir = await Directory(outputDir).create(recursive: true);
    } catch (e) {
      log.severe('Failed to open/create temp directory:\n $e');
      exit(1);
    }
    // clear temp files, ignoring any errors
    await for (var entity in dir.list()) {
      entity.delete(recursive: true);
    }
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
