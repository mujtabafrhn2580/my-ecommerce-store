import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/imports/common_imports.dart';
import 'package:my_store/widgets/layouts/grid_layout.dart';
import 'package:my_store/widgets/product_card/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Drop Down
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
          child: DropdownButtonFormField(
            items:
                [
                      'Name',
                      'Higher Price',
                      'Lower Price',
                      'Sale',
                      'Newest',
                      'Popularity',
                    ]
                    .map(
                      (option) =>
                          DropdownMenuItem(value: option, child: Text(option)),
                    )
                    .toList(),
            onChanged: (value) {},
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        //Product
        TGridLayout(
          itemCount: 4,
          itemBuilder: (context, index) => TProductCardVertical(),
        ),
      ],
    );
  }
}
