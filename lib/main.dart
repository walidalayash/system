import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:system/core/data_sources/tasks/tasks_post.dart';
import 'package:system/ui/view/info_page/info_page.dart';
import 'package:system/ui/view/login/login.dart';
import 'package:system/ui/view/root/root.dart';
import 'core/data_sources/activity/activity_post.dart';
import 'core/data_sources/equipment/equipments_post.dart';
import 'core/data_sources/material/materials_post.dart';
import 'core/data_sources/offer/offers_post.dart';
import 'core/data_sources/user/user.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  await setupFlutterNotifications();
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //  name: "system-company",
    // options: DefaultFirebaseOptions.currentPlatform,
    options: const FirebaseOptions(
      apiKey: "AIzaSyBGNC9P2BwG1cLGNNWA1N0L2gv0KkPsqA8",
      appId: "1:574917291935:android:00fcc47f03940089d997aa",
      messagingSenderId: "574917291935",
      projectId: "system-33957",
      storageBucket: "system-33957.appspot.com",
    ),
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      showFlutterNotification(message);
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Users()),
          ChangeNotifierProvider(create: (_) => TasksPost()),
          ChangeNotifierProvider(create: (_) => MaterialsPost()),
          ChangeNotifierProvider(create: (_) => EquipmentPost()),
          ChangeNotifierProvider(create: (_) => ActivityPost()),
          ChangeNotifierProvider(create: (_) => OffersPost()),
        ],
        child: MaterialApp(
          title: 'System Company',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(title: 'System Company'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isInit = true;

  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Users>(context, listen: false).fetchUsers().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final phone = FirebaseAuth.instance.currentUser?.phoneNumber;
    Provider.of<Users>(context, listen: false).fetchUsers();
    return
        //if(login and have info){
        //home()}
        //if(login and not have info){
        //info()}
        //else{
        //login}
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (Provider.of<Users>(context, listen: false)
                        .usersNow
                        .isEmpty) {
                      return const Login();
                    }
                    if (Provider.of<Users>(context, listen: false)
                                .usersNow[0]
                                .phone ==
                            null ||
                        Provider.of<Users>(context, listen: false)
                                .usersNow[0]
                                .email ==
                            null ||
                        Provider.of<Users>(context, listen: false)
                                .usersNow[0]
                                .department ==
                            null ||
                        Provider.of<Users>(context, listen: false)
                                .usersNow[0]
                                .userName ==
                            null ||
                        Provider.of<Users>(context, listen: false)
                                .usersNow[0]
                                .place ==
                            null) {
                      return const InfoPage();
                    } else {
                      return const Root();
                    }
                  } else {
                    return const Login();
                  }
                });
    // const InfoPage();
  }
}
