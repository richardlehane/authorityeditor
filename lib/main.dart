//import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart' as foundation;
import "package:flutter/services.dart";
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/view/home.dart';

void main() {
  //if (foundation.kReleaseMode) Process.run('siplicityServer', []);
  WidgetsFlutterBinding.ensureInitialized();
  if (foundation.kIsWeb) {
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
        //if (foundation.kReleaseMode) {
        //   ShutdownResponse response =
        //       await siplicityServiceClient.shutdown(ShutdownRequest());
        //   if (!response.success) {
        //     return AppExitResponse.cancel;
        //   }
        //  }
        return AppExitResponse.exit;
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Authority',
      home: const HomePage(),
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange,
      ),
    );
  }
}
