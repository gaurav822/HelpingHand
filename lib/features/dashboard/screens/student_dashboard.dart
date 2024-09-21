import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:get/get.dart";
import "package:helpinghand/features/dashboard/screens/student_chat_list_screen.dart";
import "package:helpinghand/features/dashboard/screens/profile_screen.dart";
import "package:helpinghand/features/dashboard/screens/service_screen.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import "../../service/controllers/service_controller.dart";
import "home_screen_student.dart";



class StudentDashboard extends StatefulWidget {
  final int initialIndex;
  const StudentDashboard({super.key, required this.menuScreenContext, this.initialIndex = 0});
  final BuildContext menuScreenContext;

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  late BuildContext testContext;
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.initialIndex);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
    HomeScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    ServiceListScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    StudentChatListScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),

    ProfileScreen(
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
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
        initialRoute: "/",
      ),
    ),

    PersistentBottomNavBarItem(
      icon: const Icon(Icons.task),
      title: "Services",
      inactiveIcon: const Icon(Icons.task),
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
        initialRoute: "/",
      ),
    ),

    PersistentBottomNavBarItem(
      icon: const Icon(Icons.chat),
      title: "Chats",
      inactiveIcon: const Icon(Icons.chat),
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
      inactiveColorSecondary: Colors.purple,
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
        initialRoute: "/",
      ),
    ),


    PersistentBottomNavBarItem(
      icon:  const Icon(Icons.person),
      inactiveIcon: const Icon(Icons.person),
      title: "Profile",
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
        initialRoute: "/",
      ),
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    final serviceController = Get.put(ServiceController());
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        resizeToAvoidBottomInset: true,
        navBarHeight: MediaQuery
            .of(context)
            .viewInsets
            .bottom > 0
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
}