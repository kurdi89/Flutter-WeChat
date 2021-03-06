import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_wechat/components/appbar.dart';

import '../../dataJson/userData.dart';
import '../chat/chat.dart';
import '../dynamic/timeLine.dart';
import './friendSettings.dart';
import '../../components/statusView.dart';

class Detailed extends StatefulWidget {
  Detailed({Key key, this.detail, this.heroTag = 'noTag'}) : super(key: key);
  final Map<String, dynamic> detail;
  final String heroTag;

  @override
  _DetailedState createState() => _DetailedState();
}

class _DetailedState extends State<Detailed> {
  /// 用户详情
  Map<String, dynamic> _detail;

  @override
  void initState() {
    super.initState();
    _detail = widget.detail == null ? mySelf : widget.detail;
  }

  @override
  Widget build(BuildContext context) {
    var pohtoWith =
        (MediaQuery.of(context).size.width - ScreenUtil().setWidth(350)) / 4;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: ScreenUtil().setHeight(550),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(500),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(_detail['backgroundUrl']),
                            fit: BoxFit.fill)),
                  ),
                  Opacity(
                    opacity: 0.45,
                    child: Container(
                        height: ScreenUtil().setHeight(500),
                        color: Color(0xFF555555)),
                  ),
                  Positioned(
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(120),
                      child: setCustomAppBar(context, 'Ta的详情',
                          backgroundColor: Colors.transparent)),
                  Positioned(
                      top: ScreenUtil().setHeight(90),
                      width: MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(500),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(60),
                        ),
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: widget.heroTag,
                              child: StatusHeaderImage(
                                  imageSrc: _detail['imageUrl'],
                                  width: 140,
                                  height: 140,
                                  radius: 70,
                                  needBorder: true),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${_detail['name']}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(38),
                                          height: 2),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          '${_detail['motto']}',
                                          textAlign: TextAlign.left,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(26),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      right: 15.0,
                      bottom: 0.0,
                      child: FloatingActionButton(
                        mini: true,
                        elevation: 0,
                        backgroundColor: Color(0xFF6b6aba),
                        child: Icon(
                          Icons.settings,
                          size: 30.0,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => FriendSettings(detail: _detail)));
                        },
                      ))
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(30),
                vertical: ScreenUtil().setHeight(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(150),
                  child: Text('地址:'),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      '${_detail['adress']}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF3d3d3d),
                        fontSize: ScreenUtil().setSp(24),
                      ),
                    ))
              ],
            ),
          ),
          Divider(height: 2.0),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(30),
                vertical: ScreenUtil().setHeight(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(150),
                  child: Text('签名:'),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      '${_detail['motto']}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: Color(0xFF3d3d3d),
                        fontSize: ScreenUtil().setSp(24),
                      ),
                    ))
              ],
            ),
          ),
          Divider(height: 2.0),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(30),
                  vertical: ScreenUtil().setHeight(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(150),
                    child: Text('相册:'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Image.network(_detail['imageUrl'],
                                    fit: BoxFit.cover,
                                    width: pohtoWith,
                                    height: pohtoWith),
                                Image.network(_detail['imageUrl'],
                                    fit: BoxFit.cover,
                                    width: pohtoWith,
                                    height: pohtoWith),
                                Image.network(_detail['imageUrl'],
                                    fit: BoxFit.cover,
                                    width: pohtoWith,
                                    height: pohtoWith),
                                Image.network(_detail['imageUrl'],
                                    fit: BoxFit.cover,
                                    width: pohtoWith,
                                    height: pohtoWith),
                              ],
                            )),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setHeight(25),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => TimeLine(detail: _detail)));
            },
          ),
          Divider(height: 2.0),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(100),
                right: ScreenUtil().setWidth(100),
                top: ScreenUtil().setHeight(50),
                bottom: ScreenUtil().setHeight(15)),
            child: RaisedButton(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
              color: Color(0xFF64c223),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Feather.send, size: 16, color: Colors.white),
                  Text(
                    '  发送消息',
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(30)),
                  )
                ],
              ),
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ChatPage(detail: _detail)));
              },
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(100)),
            child: RaisedButton(
              elevation: 0,
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
              color: Color(0xFFededed),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Feather.video,
                      size: 16, color: Theme.of(context).primaryColor),
                  Text(
                    '  视频通话',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: ScreenUtil().setSp(30)),
                  )
                ],
              ),
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ChatPage(detail: _detail)));
              },
            ),
          ),
        ],
      ),
    );
  }
}
