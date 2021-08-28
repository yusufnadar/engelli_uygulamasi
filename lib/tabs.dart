import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/config/tabs/bottom_navigation_bar_item.dart';
import 'package:engelli_uygulama/ui/events/add_event.dart';
import 'package:engelli_uygulama/ui/home_page/home_page.dart';
import 'package:engelli_uygulama/ui/messages/conversations.dart';
import 'package:engelli_uygulama/ui/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TabItem { HomePage, AddEvent, MessagePage, ProfilPage }

class Tabs extends StatefulWidget {
  final int currentTab1;

  Tabs({Key key, this.currentTab1}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  TabItem _currentTab = TabItem.HomePage;
  TabController _tabController;
  int currentIndex = 0;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.HomePage: GlobalKey<NavigatorState>(),
    TabItem.AddEvent: GlobalKey<NavigatorState>(),
    TabItem.ProfilPage: GlobalKey<NavigatorState>(),
    TabItem.MessagePage: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> tumSayfalar(context) {
    return {
      TabItem.HomePage: HomePage(),
      TabItem.AddEvent: AddEvent(),
      TabItem.ProfilPage: ProfilePage(),
      TabItem.MessagePage: MessagePage(),
    };
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: tumSayfalar(context).length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          currentIndex: widget.currentTab1,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/home.png',
                  color: currentIndex == 0 ? kirmizi : Colors.grey, width: 24,),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/add.png',
                color: currentIndex == 1 ? kirmizi : Colors.grey,
                width: 25,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/chat.png',
                color: currentIndex == 2 ? kirmizi : Colors.grey,
                width: 25,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/user.png',
                color: currentIndex == 3 ? kirmizi : Colors.grey,
                width: 25,
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
              var newTabItem = TabItem.values[index];
              if (newTabItem == _currentTab) {
                navigatorKeys[newTabItem].currentState.popUntil(
                      (route) => route.isFirst,
                    );
              }
              _currentTab = newTabItem;
            });
          },
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            navigatorKey: navigatorKeys[TabItem.values[index]],
            builder: (context) {
              return tumSayfalar(context)[TabItem.values[index]];
            },
          );
        },
      ),
    );
  }
}
