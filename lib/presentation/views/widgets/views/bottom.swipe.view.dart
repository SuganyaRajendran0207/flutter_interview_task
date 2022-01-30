import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_task/presentation/styles/colors.dart';
import 'package:flutter_interview_task/presentation/styles/text_styles.dart';
import 'package:flutter_interview_task/presentation/viewmodels/home.viewmodel.dart';
import 'package:flutter_interview_task/presentation/views/widgets/custom/text_variant.dart';
import 'package:intl/intl.dart';

class BottomSwipeView extends SliverPersistentHeaderDelegate {
  final double? extent;
  final EdgeInsetsGeometry? padding;

  BottomSwipeView({this.extent, this.padding});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    HomeMainViewModel model = HomeMainViewModel.provide(context);
    return Container(
      color: AppColors.primaryColor,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 175,
                width: MediaQuery.of(context).size.width,
                color: AppColors.backgroundColor.ofContext(context),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                  child: InkWell(
                    onTap: () {
                      model.navigateToFilter(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border:
                              Border.all(color: CustomColors.greyLiteColor)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.list,
                            color: CustomColors.greyLiteColor,
                            size: 16,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          TextVariant('Filter',
                              variantType: TextVariantType.body2,
                              fontSize: 12,
                              color: CustomColors.greyLiteColor),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                  disableCenter: true,
                  enlargeCenterPage: true,
                  height: 150,
                  enableInfiniteScroll: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    model.updateCurrentIndex(index);
                  },
                  autoPlay: true),
              items: model.highlights!
                  .map((swipe) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: () {
                            model.navigateToHighlight(context, swipe);
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.transparent,
                            elevation: 4,
                            shadowColor: Colors.black12.withOpacity(0.4),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          swipe.avatar!,
                                        ),
                                        fit: BoxFit.cover)),
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      TextVariant(
                                        swipe.title ?? '',
                                        variantType: TextVariantType.headline4,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      TextVariant(
                                        '${swipe.address} - ${DateFormat('dd-MMM').format(swipe.startDate!)} - ${DateFormat('dd-MMM').format(swipe.endDate!)}',
                                        variantType: TextVariantType.body2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            RichText(
                                              text: TextSpan(
                                                  text:
                                                      '\$${swipe.actualPrice.toString()}',
                                                  style: TextStyles.labelStyle(
                                                          context: context)
                                                      .copyWith(
                                                          color: Colors.red,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            ' \$${swipe.price.toString()}',
                                                        style: TextStyles
                                                                .labelStyle(
                                                                    context:
                                                                        context)
                                                            .copyWith(
                                                                color: Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontSize: 16))
                                                  ]),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextVariant(
                                                  'View Details',
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                                  variantType:
                                                      TextVariantType.body2,
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward,
                                                  size: 16,
                                                  color: Colors.white,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: InkWell(
                  onTap: () {
                    model.updateCurrentIndex(model.currentIndex - 1);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4))),
                      height: 50,
                      width: 20,
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 16,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: InkWell(
                  onTap: () {
                    model.updateCurrentIndex(model.currentIndex + 1);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4))),
                      height: 50,
                      width: 20,
                      alignment: Alignment.centerLeft,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => extent ?? 250;

  @override
  double get minExtent => extent ?? 250;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
