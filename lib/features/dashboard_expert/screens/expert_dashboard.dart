import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:helpinghand/features/dashboard/screens/expert_chat_list_screen.dart";
import "package:helpinghand/features/dashboard/screens/profile_screen.dart";
import "package:helpinghand/features/dashboard/screens/service_screen.dart";
import "package:helpinghand/features/dashboard_expert/screens/expert_home_screen.dart";
import "package:helpinghand/features/dashboard_expert/screens/expert_profile_screen.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

import "expert_chat_screen.dart";



class ExpertDashboard extends StatefulWidget {
  const ExpertDashboard({super.key, required this.menuScreenContext});
  final BuildContext menuScreenContext;

  @override
  _ExpertDashboardState createState() => _ExpertDashboardState();
}

class _ExpertDashboardState extends State<ExpertDashboard> {
  late BuildContext testContext;
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
    ExpertHomeScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    ExpertChatScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),

    ExpertProfileScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: "Home",
      inactiveIcon: const Icon(Icons.home),
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),

    PersistentBottomNavBarItem(
      icon: const Icon(Icons.chat),
      title: "Chats",
      inactiveIcon: const Icon(Icons.chat),
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
    ),


    PersistentBottomNavBarItem(
      icon:  const Icon(Icons.person),
      inactiveIcon: const Icon(Icons.person),
      title: "Profile",
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
    ),
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      bottomScreenMargin: 0,
      selectedTabScreenContext: (final context) {
        testContext = context!;
      },
      backgroundColor: Colors.black,
      hideNavigationBar: _hideNavBar,
      decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle
          .style6, // Choose the nav bar style with this property
    ),
  );
}