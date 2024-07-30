import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:updateapp/Component/MessageUpdate.dart';
import 'package:updateapp/Funcs.dart';
import 'package:updateapp/Model/UpdateModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:updateapp/pageone.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
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
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _localhost = 'http://192.168.8.100:3000';

  String version = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {

      final info = await PackageInfo.fromPlatform();

      setState(() {
        version = info.version;
      });

      await Future.delayed(2000.ms);

      connect();

    });

  }

  _getLastversion() async {

    Uri url = Uri.parse('$_localhost/update/lastversion');

    Response response = await get(url);

    Map res = jsonDecode(response.body);

    UpdateModel model = UpdateModel(res['data']);

    if(version!=model.version)
      await showMessageBox(context, MessageUpdate(data: model));

  }

  connect() {

    IO.Socket socket = IO.io(_localhost,IO.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .build()
    );

    socket.connect();

    socket.onConnect((data){
      _getLastversion();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Builder(builder: (context){
            ScreenUtil.init(context, designSize: const Size(360, 690));
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text('V : ${version}',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      )),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>pageone()));
                      },
                      child: Text('Page One ... ')
                  )
                ],
              ),
            );
          })
      ),
    );
  }


}

