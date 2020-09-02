import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wsp_clone/components/bottom_end_icon.dart';
import 'package:wsp_clone/components/custom_image_avatar.dart';
import 'package:wsp_clone/components/custom_scroll_bar.dart';
import 'package:wsp_clone/constants.dart';
import 'package:wsp_clone/model/status.dart';
import 'package:wsp_clone/services/status_service.dart';
import 'package:wsp_clone/util/date_util.dart';
import 'package:wsp_clone/views/camera/camera_view.dart';

class StatusView extends StatefulWidget {
  final CameraDescription camera;

  StatusView({this.camera});

  @override
  _StatusViewState createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  List<Status> viewedStatuses;
  List<Status> newStatuses;

  @override
  void initState() {
    List<Status> statuses = StatusService.getStatuses();
    viewedStatuses = statuses.where((s) => s.viewed).toList();
    newStatuses = statuses.where((s) => !s.viewed).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollBar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text(
                  'My status',
                  style: TextStyle(color: kTextColor),
                ),
                subtitle: Text(
                  'Tap to add status update',
                  style: TextStyle(
                    color: kGreyColor,
                  ),
                ),
                leading: CustomImageAvatar(
                  imgSrc: 'images/profile-pictures/my_profile.jpg',
                  bottomEndIcon: BottomEndIcon(
                    icon: Icon(
                      Icons.add,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Recent updates',
                  style: TextStyle(color: kGreyColor),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  final status = newStatuses[index];

                  return ListTile(
                    title: Text(
                      status.contact.name,
                      style: TextStyle(color: kTextColor),
                    ),
                    subtitle: Text(
                      'TODAY, ' + DateUtil.formatDate(status.date),
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: kAccentColor,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: kScaffoldBackgroundColor,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(status.imgSrc),
                          radius: 23.0,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: newStatuses.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Viewed updates',
                  style: TextStyle(color: kGreyColor),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  final status = viewedStatuses[index];

                  return ListTile(
                    title: Text(
                      status.contact.name,
                      style: TextStyle(color: kTextColor),
                    ),
                    subtitle: Text(
                      DateUtil.formatDate(status.date),
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: kGreyColor,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: kScaffoldBackgroundColor,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(status.imgSrc),
                          radius: 23.0,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: viewedStatuses.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: '',
            onPressed: () {},
            child: Icon(Icons.edit),
            backgroundColor: kSecondaryButton,
            mini: true,
          ),
          SizedBox(height: 15.0),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraView(camera: widget.camera),
                ),
              );
            },
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
