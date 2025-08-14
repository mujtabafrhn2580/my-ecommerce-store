import 'package:my_store/utils/imports/common_imports.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TabBar(
      isScrollable: false,
      indicatorColor: TColors.primary,
      tabs: tabs,
      labelColor: isDark ? TColors.white : TColors.primary,
      unselectedLabelColor: TColors.darkGrey,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
