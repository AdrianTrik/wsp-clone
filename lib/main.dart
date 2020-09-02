import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wsp_clone/views/call/calls_view.dart';
import 'package:wsp_clone/views/camera/camera_view.dart';
import 'package:wsp_clone/views/chat/chats_view.dart';
import 'package:wsp_clone/views/status/status_view.dart';
import 'constants.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final camera = cameras.first;

  runApp(MyApp(camera: camera));
}

class MyApp extends StatefulWidget {
  final CameraDescription camera;

  MyApp({this.camera});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _activeTabIndex = 1;

  void _setActiveTabIndex() {
    setState(() {
      _activeTabIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 4, initialIndex: 1);
    _tabController.addListener(_setActiveTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerColor: kDividerColor,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        accentColor: kAccentColor,
      ),
      home: Scaffold(
        appBar: _activeTabIndex == 0
            ? null
            : AppBar(
                title: Text(
                  'WhatsApp',
                  style: TextStyle(
                    color: kGreyColor,
                  ),
                ),
                actions: kDefaultOptions,
                bottom: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  labelColor: kAccentColor,
                  unselectedLabelColor: kGreyColor,
                  tabs: [
                    Tab(icon: Icon(Icons.camera_alt)),
                    Container(
                      child: Tab(text: 'CHATS'),
                      width: 85,
                    ),
                    Container(
                      child: Tab(text: 'STATUS'),
                      width: 85,
                    ),
                    Container(
                      child: Tab(text: 'CALLS'),
                      width: 85,
                    ),
                  ],
                ),
              ),
        body: TabBarView(
          controller: _tabController,
          children: [
            CameraView(camera: widget.camera),
            ChatsView(),
            StatusView(camera: widget.camera),
            CallsView(),
          ],
        ),
      ),
    );
  }
}
