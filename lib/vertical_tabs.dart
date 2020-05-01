import 'package:flutter/material.dart';
class VerticalTabs extends StatefulWidget {
  final Key key;
  final double tabsWidth;
  final double itemExtent;
  final double indicatorWidth;
  final List<Tab> tabs;
  final List<Widget> contents;
  final TextDirection direction;
  final Color indicatorColor;
  final bool disabledChangePageFromContentView;
  final Axis contentScrollAxis;
  final Color selectedTabBackgroundColor;
  final Color unselectedTabBackgroundColor;
  final Color dividerColor;
  final Duration changePageDuration;
  final Curve changePageCurve;
  final Color tabsShadowColor;
  final double tabsElevation;
  VerticalTabs(
      {this.key,
      @required this.tabs,
      @required this.contents,
      this.tabsWidth = 100,
      this.itemExtent = 90,
      this.indicatorWidth = 5,
      this.direction = TextDirection.ltr,
      this.indicatorColor = const Color(0xFFFB2F4D),
      this.disabledChangePageFromContentView = true,
      this.contentScrollAxis = Axis.horizontal,
      this.selectedTabBackgroundColor = const Color(0xFF041ABD),
      this.unselectedTabBackgroundColor = const Color(0xFF011399),
      this.dividerColor = Colors.transparent,
      this.changePageCurve = Curves.easeInOut,
      this.changePageDuration = const Duration(milliseconds: 100),
      this.tabsShadowColor = Colors.transparent,
      this.tabsElevation = 0.0})
      : assert(
            tabs != null && contents != null && tabs.length == contents.length),
        super(key: key);
  @override
  _VerticalTabsState createState() => _VerticalTabsState();
}
class _VerticalTabsState extends State<VerticalTabs>
    with TickerProviderStateMixin {
  int _selectedIndex = 1;
  bool _changePageByTapView;
  AnimationController animationController;
  Animation<double> animation;
  Animation<RelativeRect> rectAnimation;
  PageController pageController = PageController();
  List<AnimationController> animationControllers = [];
  ScrollPhysics pageScrollPhysics = AlwaysScrollableScrollPhysics();
  @override
  void initState() {
    for (int i = 0; i < widget.tabs.length; i++) {
      animationControllers.add(AnimationController(
        duration: widget.changePageDuration * 3,
        vsync: this,
      ));
    }
    
    print(_selectedIndex);
    _selectTab(_selectedIndex);

    if (widget.disabledChangePageFromContentView == true)
      pageScrollPhysics = NeverScrollableScrollPhysics();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
//    Border border = Border(
//        right: BorderSide(
//            width: 0.5, color: widget.dividerColor));
//    if (widget.direction == TextDirection.rtl) {
//      border = Border(
//          left: BorderSide(
//              width: 0.5, color: widget.dividerColor));
//    }
    return Directionality(
      textDirection: widget.direction,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  child: Container(
                    width: 90,
                    padding: EdgeInsets.fromLTRB(0, 7, 2, 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF011399),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      itemExtent: widget.itemExtent,
                      itemCount: widget.tabs.length,
                      itemBuilder: (context, index) {
                        Tab tab = widget.tabs[index];
                        Alignment alignment = Alignment.center;
                        if (widget.direction == TextDirection.rtl) {
                          alignment = Alignment.center;
                        }
                        Widget child;
                        if (tab.child != null) {
                          child = tab.child;
                        } else {
                          child = Row(
                            children: <Widget>[
                              (tab.icon != null)
                                  ? Row(
                                      children: <Widget>[
                                        tab.icon,
                                        SizedBox(
                                          width: 30,
                                        )
                                      ],
                                    )
                                  : Container(),
                              (tab.text != null) ? Text(tab.text) : Container(),
                            ],
                          );
                        }
                        Color itemBGColor = widget.unselectedTabBackgroundColor;
                        if (_selectedIndex == index )
                          itemBGColor = widget.selectedTabBackgroundColor;
                        return GestureDetector(
                          onTap: () {
                            _changePageByTapView = true;
                            if(index !=0 ){           /////////////////////////////////////////////////////////////////////////due to first logo dockbook
                              setState(() {
                                _selectTab(index);
                              });
                              pageController.animateToPage(index,
                                  duration: widget.changePageDuration,
                                  curve: widget.changePageCurve);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: itemBGColor,
//                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ScaleTransition(
                                  child: Container(
                                    width: widget.indicatorWidth,
                                    height: widget.itemExtent,
                                    color: widget.indicatorColor,
                                  ),
                                  scale: Tween(begin: 0.0, end: 1.0).animate(
                                    new CurvedAnimation(
                                      parent: animationControllers[index],
                                      curve: Curves.elasticOut,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: alignment,
                                    padding: EdgeInsets.all(0),
                                    child: child,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // elevation: widget.tabsElevation,
                  // shadowColor: widget.tabsShadowColor,
                  // shape: BeveledRectangleBorder(),
                ),
                Expanded(
                  child: PageView.builder(
                    scrollDirection: widget.contentScrollAxis,
                    physics: pageScrollPhysics,
                    onPageChanged: (index) {
                      if (_changePageByTapView == false ||
                          _changePageByTapView == null ) {
                        // _selectTab(index);
                      }
                      if (_selectedIndex == index) {
                        // _changePageByTapView = null;
                      }
                      setState(() {});
                    },
                    controller: pageController,
                    // the number of pages
                    itemCount: widget.contents.length,
                    // building pages
                    itemBuilder: (BuildContext context, int index) {
                      return widget.contents[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _selectTab(index) {
    _selectedIndex = index;
    for (AnimationController animationController in animationControllers) {
      animationController.reset();
    }
    animationControllers[index].forward();
  }
}