import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sculptgen/amplifyconfiguration.dart';
import 'package:sculptgen/app.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sculptgen/models/ModelProvider.dart';
import 'package:sculptgen/providers/message_provider.dart';
import 'package:sculptgen/providers/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => MessageProvider()),
      ],
      child: const App(),
    ),
  );
}




Future<void> configureAmplify() async {
  try {
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugins([api, auth]);
    await Amplify.configure(amplifyconfig);
    safePrint("Amplify configured successfully");
  } catch (e) {
    safePrint("Error configuring Amplify: $e");
  }
}