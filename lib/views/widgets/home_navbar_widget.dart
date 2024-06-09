import 'package:assesment2/views/screen/beranda/beranda_views.dart';
import 'package:assesment2/views/screen/to_do_list/to_do_list_views.dart';
import 'package:assesment2/views/screen/explore/explore_views.dart';
import 'package:assesment2/views/screen/profile/profile_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class HomeNavbarWidget extends StatefulWidget {
  const HomeNavbarWidget({
    super.key,
    this.isFromHome = false,
  });

  final bool isFromHome;

  @override
  State<HomeNavbarWidget> createState() => _HomeNavbarWidgetState();
}

class _HomeNavbarWidgetState extends State<HomeNavbarWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  Color selectedColor = const Color.fromRGBO(59, 38, 122, 1);
  Color unselectedColor = Colors.white;

  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.isFromHome ? 2 : 0;
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: _selectedIndex,
    );

    tabController.addListener(
      () {
        if (tabController.indexIsChanging) {
          _onPageTapped(tabController.index);
        }
      },
    );

    super.initState();
  }

  final List<Widget> _pageViews = [
    const HomeScreen(),
    const TodoListScreen(),
    const ExploreScreen(),
    ProfileScreen(),
  ];

  void _onPageTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
                color: _selectedIndex == 0 ? selectedColor : unselectedColor,
              ),
            ),
            SizedBox(
              height: 60,
              child: Icon(
                Icons.edit_note,
                color: _selectedIndex == 1 ? selectedColor : unselectedColor,
              ),
            ),
            SizedBox(
              height: 60,
              child: Icon(
                Icons.video_collection,
                color: _selectedIndex == 2 ? selectedColor : unselectedColor,
              ),
            ),
            SizedBox(
              height: 60,
              child: Icon(
                Icons.settings,
                color: _selectedIndex == 3 ? selectedColor : unselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
