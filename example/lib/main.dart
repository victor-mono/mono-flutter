import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mono_flutter/mono_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
          child: ElevatedButton(
        child: const Text('launch mono'),
        onPressed: () {
          // if (kIsWeb) {
          MonoFlutter().launch(
            context,
            'live_pk_i3bamg4plgftxom3ssei', //  'live_pk_i3bamg4plgftxom3ssei',
            scope: "auth",
            // reAuthCode: 'code_7ZSg9UB0sZsMSL3ygb6X',
            reference: DateTime.now().millisecondsSinceEpoch.toString(),
            customer: const MonoCustomer(
              newCustomer: MonoNewCustomerModel(
                name: "Samuel Olamide", // REQUIRED
                email: "samuel@neem.com", // REQUIRED
                identity: MonoNewCustomerIdentity(
                  type: "bvn",
                  number: "2323233239",
                ),
              ),
              // existingCustomer: MonoExistingCustomerModel(
              //   id: "6759f68cb587236111eac1d4", // REQUIRED
              // ),
            ),
            // selectedInstitution: const ConnectInstitution(
            //   id: "5f2d08be60b92e2888287702",
            //   authMethod: ConnectAuthMethod.mobileBanking,
            // ),
            onEvent: (event, data) {
              if (kDebugMode) print('event: $event, data: $data');
            },
            onClosed: (code) {
              if (kDebugMode) print('Modal closed $code');
            },
            onLoad: () {
              if (kDebugMode) print('Mono loaded successfully');
            },
            onSuccess: (code) {
              if (kDebugMode) print('Mono Success $code');
            },
          );
          // }
          // Navigator.of(context)
          //     .push(CupertinoPageRoute(
          //         builder: (c) => MonoWebView(
          //               apiKey: 'test_pk_qtys19MqGkmrkGk9RDjc',
          //               config: {
          //                 "selectedInstitution": {
          //                   "id": "5f2d08bf60b92e2888287703",
          //                   "auth_method": "internet_banking"
          //                 }
          //               },
          //               onEvent: (event, data) {
          //                 print('event: $event, data: $data');
          //               },
          //               onClosed: () {
          //                 print('Modal closed');
          //               },
          //               onLoad: () {
          //                 print('Mono loaded successfully');
          //               },
          //               onSuccess: (code) {
          //                 print('Mono Success $code');
          //               },
          //             )))
          //     .then((code) => print(code));
        },
      )),
    );
  }
}
