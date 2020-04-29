import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_wechat/components/appbar.dart';
import 'package:flutter_wechat/components/button.dart';

import '../../dataJson/userData.dart';

class SetNickNamePage extends StatefulWidget {
  SetNickNamePage({Key key, this.detail, this.heroTag = 'noTag'})
      : super(key: key);
  final Map<String, dynamic> detail;
  final String heroTag;

  @override
  _SetNickNamePageState createState() => _SetNickNamePageState();
}

class _SetNickNamePageState extends State<SetNickNamePage> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  /// 用户详情
  Map<String, dynamic> _detail;

  @override
  void initState() {
    super.initState();
    _detail = widget.detail == null ? mySelf : widget.detail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f1f1),
      appBar: setCustomAppBar(context, '设置备注和标签', actions: [
        TextButton(
          text: '提交',
          onPressed: () {},
        )
      ]),
      body: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: CupertinoTextField(
                  focusNode: _focusNode,
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                  prefix: Container(
                    width: ScreenUtil().setWidth(150),
                    alignment: Alignment.centerRight,
                    child: Text('备注名:',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: ScreenUtil().setSp(26),
                        )),
                  ),
                  placeholder: '请输入微信号/公众号...',
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20),
                      vertical: ScreenUtil().setHeight(30)),
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: ScreenUtil().setSp(26),
                  ),
                  placeholderStyle: TextStyle(
                    color: Color(0xffbbbbbb),
                    fontSize: ScreenUtil().setSp(22),
                  ),
                  suffix: GestureDetector(
                    child: Icon(Icons.close, size: ScreenUtil().setWidth(30)),
                    onTap: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  ),
                  onChanged: (val) {},
                ))),
        Container(height: ScreenUtil().setHeight(20), color: Color(0xFFededed)),
        Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: CupertinoTextField(
                  focusNode: _focusNode,
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                  prefix: Container(
                    width: ScreenUtil().setWidth(150),
                    alignment: Alignment.centerRight,
                    child: Text('标签:',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: ScreenUtil().setSp(26),
                        )),
                  ),
                  placeholder: '请输入标签...',
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20),
                      vertical: ScreenUtil().setHeight(30)),
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: ScreenUtil().setSp(26),
                  ),
                  placeholderStyle: TextStyle(
                    color: Color(0xffbbbbbb),
                    fontSize: ScreenUtil().setSp(22),
                  ),
                  suffix: GestureDetector(
                    child: Icon(Icons.close, size: ScreenUtil().setWidth(30)),
                    onTap: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  ),
                  onChanged: (val) {},
                ))),
        Container(height: ScreenUtil().setHeight(20), color: Color(0xFFededed)),
        Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: CupertinoTextField(
                  focusNode: _focusNode,
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                  prefix: Container(
                    width: ScreenUtil().setWidth(150),
                    alignment: Alignment.centerRight,
                    child: Text('电话号码:',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: ScreenUtil().setSp(26),
                        )),
                  ),
                  placeholder: '请输入电话号码...',
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent)),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20),
                      vertical: ScreenUtil().setHeight(30)),
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: ScreenUtil().setSp(26),
                  ),
                  placeholderStyle: TextStyle(
                    color: Color(0xffbbbbbb),
                    fontSize: ScreenUtil().setSp(22),
                  ),
                  suffix: GestureDetector(
                    child: Icon(Icons.close, size: ScreenUtil().setWidth(30)),
                    onTap: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  ),
                  onChanged: (val) {},
                ))),
        Container(height: ScreenUtil().setHeight(20), color: Color(0xFFededed)),
        Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  width: ScreenUtil().setWidth(190),
                  alignment: Alignment.centerRight,
                  child: Text('描述:',
                      style: TextStyle(
                        height: 2.8,
                        color: Color(0xFF333333),
                        fontSize: ScreenUtil().setSp(26),
                      )),
                ),
                Expanded(
                    flex: 1,
                    child: CupertinoTextField(
                      focusNode: _focusNode,
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      maxLength: 50,
                      placeholder: '请输入描述...',
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(20),
                          vertical: ScreenUtil().setHeight(30)),
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: ScreenUtil().setSp(26),
                      ),
                      placeholderStyle: TextStyle(
                        color: Color(0xffbbbbbb),
                        fontSize: ScreenUtil().setSp(22),
                      ),
                      minLines: 4,
                      maxLines: 6,
                      suffix: GestureDetector(
                        child:
                            Icon(Icons.close, size: ScreenUtil().setWidth(30)),
                        onTap: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      ),
                      onChanged: (val) {},
                    ))
              ],
            )),
      ]),
    );
  }
}
