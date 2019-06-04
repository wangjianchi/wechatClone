import 'package:flutter/material.dart';
import 'package:wechat_clone/constants.dart';
import '../constants.dart' show AppIconFont;

enum ActionItems{
  GROUP_CHAT,ADD_FRIEND,QR_SCAN,PAYMENT,HELP
}


class NavigationIconView{
  final BottomNavigationBarItem item;

  NavigationIconView({Key key,String title,IconData icon,IconData activeIcon}) : 
  item = BottomNavigationBarItem(
    icon:  Icon(icon),
    activeIcon:  Icon(activeIcon),
    title: Text(title),
    backgroundColor: Colors.white
  );

}


class HomeScreen extends StatefulWidget {
 
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<NavigationIconView> _navigationViews;
 int _currentIndex = 0;
  @override
  void initState() { 
    super.initState();
     _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: AppIconFont().buidIconData(0xe608),
        activeIcon: AppIconFont().buidIconData(0xe603)
      ),
      NavigationIconView(
        title: '通讯录',
        icon: AppIconFont().buidIconData(0xe601),
        activeIcon: AppIconFont().buidIconData(0xe656)
      ),
      NavigationIconView(
        title: '发现',
        icon: AppIconFont().buidIconData(0xe600),
        activeIcon: AppIconFont().buidIconData(0xe671)
      ),
      NavigationIconView(
        title: '我',
        icon: AppIconFont().buidIconData(0xe6c0),
        activeIcon: AppIconFont().buidIconData(0xe626)
      )
    ];
  }


  _buildPopupMenuItem(int iconName,String title){
    return Row(
      children: <Widget>[
        Icon(AppIconFont().buidIconData(iconName),size: 22,color: Colors.white),
        Container(width: 16),
        Text(title,style: TextStyle(color:Colors.white))
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconAcitve),
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
         _currentIndex = index; 
        });
      },
    );



    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: AppIconFont().buidIconFont(0xe65e),
            onPressed: (){
              print('search');
              },
            ),
            Container(width: 8),
             PopupMenuButton(
              itemBuilder: (BuildContext context){
                return <PopupMenuItem<ActionItems>>[
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe69e, '发起群聊'),
                      value: ActionItems.GROUP_CHAT
                    ),
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe638, '添加朋友'),
                      value: ActionItems.ADD_FRIEND
                    ),
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe61b, '扫一扫'),
                      value: ActionItems.QR_SCAN
                    ),
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe62a, '收付款'),
                      value: ActionItems.PAYMENT
                    ),
                    PopupMenuItem(
                      child: _buildPopupMenuItem(0xe63d, '帮组与反馈'),
                      value: ActionItems.HELP
                    ),
                ];
              },
             icon: Icon(Icons.add,size: 32),
             onSelected: (ActionItems selected){

             },
            ),                 
            Container(width: 16)
        ],
      ),
      body: Container(

      ),
      bottomNavigationBar: botNavBar,
    );
  }
}