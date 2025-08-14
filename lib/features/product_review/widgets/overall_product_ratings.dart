import 'package:my_store/utils/imports/common_imports.dart';

class OverAllproductRatings extends StatelessWidget {
  const OverAllproductRatings({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: textTheme.headlineLarge!.apply(fontSizeFactor: 1.8),
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              ProgressIndicator(textTheme: textTheme, number: '5'),
              ProgressIndicator(textTheme: textTheme, number: '4'),
              ProgressIndicator(textTheme: textTheme, number: '3'),
              ProgressIndicator(textTheme: textTheme, number: '2'),
              ProgressIndicator(textTheme: textTheme, number: '1'),
            ],
          ),
        ),
      ],
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.textTheme,
    required this.number,
  });

  final TextTheme textTheme;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(number, style: textTheme.bodyMedium),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: SizedBox(
            width: THelperFunctions.screenWidth() * 0.8,
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 11,
              backgroundColor: TColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(TColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
