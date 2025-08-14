import 'package:my_store/utils/imports/common_imports.dart';

class TSettingsTile extends StatelessWidget {
  const TSettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      leading: Icon(icon, size: 28, color: TColors.primary),
      subtitle: Text(
        subtitle,
        style: Theme.of(
          context,
        ).textTheme.labelMedium!.apply(color: TColors.darkGrey),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
