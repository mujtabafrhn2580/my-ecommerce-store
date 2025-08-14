import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/images/t_circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        image: TImages.tUserProfileImage,
        width: 50,
        height: 50,
      ),
      title: Text(
        'Muhammad Mujtaba',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        'mujtabafrhn@gmail.com',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: TColors.textWhite),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Iconsax.edit, color: TColors.textWhite),
      ),
    );
  }
}
