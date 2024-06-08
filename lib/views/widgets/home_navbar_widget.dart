import 'package:assesment2/views/screen/beranda/beranda_views.dart';
import 'package:assesment2/views/screen/to_do_list/to_do_list_views.dart';
import 'package:assesment2/views/screen/explore/explore_views.dart';
import 'package:assesment2/views/screen/history/history_views.dart';
import 'package:assesment2/views/screen/setting/setting_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class HomeNavbarWidget extends StatefulWidget {
  HomeNavbarWidget({
    super.key,
    this.selectedIndex = 0,
  });

  int? selectedIndex;

  @override
  State<HomeNavbarWidget> createState() => _HomeNavbarWidgetState();
}

class _HomeNavbarWidgetState extends State<HomeNavbarWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  Color selectedColor = const Color.fromRGBO(59, 38, 122, 1);
  Color unselectedColor = Colors.white;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != widget.selectedIndex && mounted) {
          _onPageTapped(value);
        }
      },
    );

    super.initState();
  }

  final List<Widget> _pageViews = [
    const HomeScreen(),
    const ToDoListScreen(),
    const ExploreScreen(),
    const HistoryScreen(),
    const SettingScreen(),
  ];

  void _onPageTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        offset: 45,
        width: 300,
        curve: Curves.easeIn,
        // barDecoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(50),
        // ),
        barColor: const Color.fromRGBO(59, 38, 122, 1),
        body: (context, controller) => TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: _pageViews,
        ),
        borderRadius: BorderRadius.circular(50),
        child: TabBar(
          dividerColor: Colors.transparent,
          splashBorderRadius: BorderRadius.zero,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.transparent,
          indicatorPadding: const EdgeInsets.all(8),
          indicator: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          tabs: [
            SizedBox(
              height: 60,
              child: Icon(
                Icons.home,
                color: widget.selectedIndex == 0 ? selectedColor : unselectedColor,
              ),
            ),
            SizedBox(
              height: 60,
              child: Icon(
                Icons.edit_note,
                color: widget.selectedIndex == 1 ? selectedColor : unselectedColor,
              ),
            ),
            SizedBox(
              height: 60,
              child: Icon(
                Icons.video_collection,
                color: widget.selectedIndex == 2 ? selectedColor : unselectedColor,
              ),
            ),
            SizedBox(
              height: 60,
              child: Icon(
                Icons.access_time_filled,
                color: widget.selectedIndex == 3 ? selectedColor : unselectedColor,
              ),
            ),
            SizedBox(
              height: 60,
              child: Icon(
                Icons.settings,
                color: widget.selectedIndex == 4 ? selectedColor : unselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
