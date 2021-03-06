import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../detail/detailed.dart';
import '../detail/qrcode.dart';
import '../contacts/contacts.dart';
import '../../common/index.dart';
import '../dynamic/timeLine.dart';
import '../detail/userSetting.dart';

class IndexLeftDrawer extends StatefulWidget {
  IndexLeftDrawer({Key key}) : super(key: key);

  @override
  IndexLeftDrawerState createState() => IndexLeftDrawerState();
}

class IndexLeftDrawerState extends State<IndexLeftDrawer> {
  /// leftDrawer 菜单列表
  List<Map<String, dynamic>> _drawerList = [
    {'icon': Feather.message_circle, 'title': 'WeChat', 'onTap': (context) {}},
    {
      'icon': Feather.star,
      'title': '联系人',
      'onTap': (context) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return ContactsPage();
        })).then((oldValue) {
          CommonState.selectDrawerIndex = 0;
        });
      }
    },
    {
      'icon': Feather.smile,
      'title': '朋友圈',
      'onTap': (context) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return TimeLine();
        })).then((oldValue) {
          CommonState.selectDrawerIndex = 0;
        });
      }
    },
    {'icon': Feather.tag, 'title': '收藏'},
    {
      'icon': Feather.settings,
      'title': '设置',
      'onTap': (context) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return UserSetting();
        })).then((oldValue) {
          CommonState.selectDrawerIndex = 0;
        });
      }
    }
  ];

  ///  退出登录Item
  Map logOut = {
    'icon': Feather.x_octagon,
    'title': '退出登录',
    'onTap': (context) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('提示'),
                content: Text('你确定要退出吗?'),
                actions: <Widget>[
                  OutlineButton(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  OutlineButton(
                    child: Text('确定'),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      navigatorKey.currentState.pushReplacementNamed('/signIn');
                    },
                  )
                ],
              ));
    }
  };

  /// 返回所有list
  List<Widget> _returnDrawerList() {
    List<Widget> widgetList = [];

    for (int i = 0; i < _drawerList.length; i++) {
      Color color =
          CommonState.selectDrawerIndex == i ? Color(0xFF66c627) : Colors.white;
      Map item = _drawerList[i];
      widgetList.add(_returnDrawerListItem(item, color, i));
    }
    return widgetList;
  }

  /// 返回单个Item
  Widget _returnDrawerListItem(item, color, i) {
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      leading: Icon(item['icon'], color: color),
      title: Text(
        '${item['title']}',
        style: TextStyle(fontSize: ScreenUtil().setSp(24), color: color),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: color,
        size: ScreenUtil().setWidth(40),
      ),
      onTap: () {
        setState(() {
          CommonState.selectDrawerIndex = i;
        });
        // Navigator.of(context).pop();
        item['onTap'](context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.fitWidth)),
        child: Column(
          children: <Widget>[
            Container(
                height: ScreenUtil().setHeight(500),
                child: Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(60),
                  ),
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            icon:
                                Icon(FontAwesome.qrcode, color: Colors.black54),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return QrCodePage();
                              }));
                            }),
                      ),
                      Hero(
                        tag: 'myself',
                        child: GestureDetector(
                          child: Container(
                              width: ScreenUtil().setWidth(140),
                              height: ScreenUtil().setWidth(140),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/header.png'),
                                      fit: BoxFit.fill),
                                  border: Border.all(
                                      width: ScreenUtil().setWidth(4),
                                      color: Colors.white),
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(140)))),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return Detailed(heroTag: 'myself');
                            }));
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'kuaifengle',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(36),
                                    height: 2),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    '如果我是Dj你会爱我吗?如果我是Dj你会爱我吗?如果我是Dj你会爱我吗?如果我是Dj你会爱我吗?如果我是Dj你会爱我吗?',
                                    textAlign: TextAlign.left,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xFFededed),
                                      fontSize: ScreenUtil().setSp(24),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFF242329),
                  child: Column(
                    children: <Widget>[]..addAll(_returnDrawerList()),
                  ),
                ))
          ],
        ),
      ),
      Positioned(
          bottom: 0,
          left: 0,
          width: MediaQuery.of(context).size.width,
          child: _returnDrawerListItem(logOut, Colors.white, 0))
    ]));
  }
}
