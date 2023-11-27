import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final nativeUrl =
                    Uri.parse('twitter://user?screen_name=isekiryu');
                final webUrl = Uri.parse('https://twitter.com/isekiryu');
                if (await canLaunchUrl(nativeUrl)) {
                  await launchUrl(
                    nativeUrl,
                    mode: LaunchMode.externalApplication,
                  );
                } else if (await canLaunchUrl(webUrl)) {
                  await launchUrl(
                    webUrl,
                    mode: LaunchMode.platformDefault,
                  );
                }
              },
              child: const Text('Twitter'),
            ),
            ElevatedButton(
              onPressed: () async {
                final nativeUrl =
                    Uri.parse('instagram://user?username=iseki_ryutaro');
                final webUrl =
                    Uri.parse('https://www.instagram.com/iseki_ryutaro/');
                if (await canLaunchUrl(nativeUrl)) {
                  await launchUrl(
                    nativeUrl,
                    mode: LaunchMode.externalApplication,
                  );
                } else if (await canLaunchUrl(webUrl)) {
                  await launchUrl(
                    webUrl,
                    mode: LaunchMode.platformDefault,
                  );
                }
              },
              child: const Text('Instagram'),
            ),
          ],
        ),
      ),
    );
  }
}
