import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_task/domain/data/models/home_list.model.dart';
import 'package:flutter_interview_task/domain/services/helpers/utils.helper.dart';
import 'package:flutter_interview_task/presentation/styles/colors.dart';
import 'package:flutter_interview_task/presentation/views/widgets/custom/dotted_line.dart';
import 'package:flutter_interview_task/presentation/views/widgets/custom/text_variant.dart';

class TrainingWidget extends StatelessWidget {
  const TrainingWidget(
      {Key? key, required this.training, required this.onPressed})
      : super(key: key);

  final Training? training;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onPressed,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          shadowColor: Colors.black12.withOpacity(0.4),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 2.0, bottom: 2.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).colorScheme.surface),
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextVariant(
                          UtilsHelper.getTrainingDate(
                              training!.startDate, training!.endDate),
                          variantType: TextVariantType.headline4,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 4),
                        TextVariant(
                          UtilsHelper.getTrainingTime(
                                  training!.startTime, training!.endTime)
                              .toLowerCase(),
                          variantType: TextVariantType.body2,
                          fontSize: 12,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: TextVariant(
                              '${training!.address}, ${training!.country!.name}',
                              variantType: TextVariantType.body2,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const DotLine(
                    size: Size(1, double.infinity),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextVariant(
                          UtilsHelper.getCategoryText(training!.category),
                          variantType: TextVariantType.body2,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                          fontSize: 12,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: TextVariant(
                                training!.title ?? '',
                                variantType: TextVariantType.headline4,
                                fontSize: 16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextVariant(
                              '(${training!.rating})',
                              variantType: TextVariantType.headline4,
                              fontSize: 16,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ProfileImage(training: training),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextVariant(
                                  '${training!.speaker!.type} Speaker',
                                  variantType: TextVariantType.body2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextVariant(
                                  training!.speaker!.name ?? '',
                                  variantType: TextVariantType.body2,
                                  fontSize: 12,
                                ),
                              ],
                            )
                          ],
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.primaryColor),
                            child: const TextVariant('Enrol Now',
                                variantType: TextVariantType.body2,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.training}) : super(key: key);
  final Training? training;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 52,
      child: Stack(
        children: <Widget>[
          Align(
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                  image: DecorationImage(
                      image: NetworkImage(training!.speaker!.avatar!),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
              top: 46 - 46 / 5,
              left: 46 - 46 / 3,
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: (46 / 4) + 4,
                  width: (46 / 4) + 4,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 1),
                      color: AppColors.secondaryColor,
                      image: DecorationImage(
                          image: NetworkImage(training!.speaker!.logo!),
                          fit: BoxFit.cover)),
                ),
              ))
        ],
      ),
    );
  }
}
