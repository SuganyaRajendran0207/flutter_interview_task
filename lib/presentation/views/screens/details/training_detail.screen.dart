import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_task/domain/data/models/home_list.model.dart';
import 'package:flutter_interview_task/domain/services/helpers/utils.helper.dart';
import 'package:flutter_interview_task/presentation/styles/colors.dart';
import 'package:flutter_interview_task/presentation/styles/text_styles.dart';
import 'package:flutter_interview_task/presentation/viewmodels/training_detail.viewmodel.dart';
import 'package:flutter_interview_task/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter_interview_task/presentation/views/widgets/views/compound_training.dart';

class TrainingDetailPage extends StatelessWidget {
  const TrainingDetailPage({Key? key, required this.training})
      : super(key: key);

  final Training training;

  @override
  Widget build(BuildContext context) {
    return TrainingDetailViewModel.buildWithProvider(
        builder: (_, __) {
          return const _TrainingDetailBody();
        },
        training: training);
  }
}

class _TrainingDetailBody extends StatelessWidget {
  const _TrainingDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrainingDetailViewModel model = TrainingDetailViewModel.provide(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: true,
                  expandedHeight: 300,
                  collapsedHeight: 56,
                  elevation: 0,
                  pinned: true,
                  iconTheme:
                      IconTheme.of(context).copyWith(color: Colors.white),
                  title: Visibility(
                    visible: innerBoxIsScrolled,
                    child: TextVariant(
                      model.training!.title ?? '',
                      variantType: TextVariantType.headline6,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(model.training!.avatar!),
                              fit: BoxFit.cover)),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(16),
                      child: TextVariant(
                        model.training!.title ?? '',
                        variantType: TextVariantType.headline6,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                )),
          ];
        },
        body: model.isBlocked
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const _TrainingDetailView(),
      ),
      bottomNavigationBar: Container(
        height: 56,
        decoration: const BoxDecoration(
            color: CustomColors.limeColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                  text: 'Price : ',
                  style: TextStyles.labelStyle(context: context)
                      .copyWith(color: Colors.red, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\$${model.training!.actualPrice.toString()}',
                        style: TextStyles.labelStyle(context: context).copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 16)),
                    TextSpan(
                        text: ' \$${model.training!.price.toString()}',
                        style: TextStyles.labelStyle(context: context).copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            fontSize: 16))
                  ]),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryColor),
              child: const TextVariant('Enrol Now',
                  variantType: TextVariantType.body2,
                  fontSize: 12,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class _TrainingDetailView extends StatelessWidget {
  const _TrainingDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrainingDetailViewModel model = TrainingDetailViewModel.provide(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextVariant(
                        UtilsHelper.getCategoryText(model.training!.category),
                        variantType: TextVariantType.body2,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                        fontSize: 12,
                      ),
                      TextVariant(
                        '${model.training!.rating} / 5',
                        variantType: TextVariantType.body2,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8),
                  child: TextVariant(
                    'Trainer',
                    variantType: TextVariantType.headline6,
                    fontSize: 12,
                    color: CustomColors.greyLiteColor,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ProfileImage(training: model.training),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextVariant(
                          '${model.training!.speaker!.type} Speaker',
                          variantType: TextVariantType.body2,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextVariant(
                          model.training!.speaker!.name ?? '',
                          variantType: TextVariantType.body2,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 8),
                  child: TextVariant(
                    'Description',
                    variantType: TextVariantType.headline6,
                    fontSize: 12,
                    color: CustomColors.greyLiteColor,
                  ),
                ),
                TextVariant(
                  model.training!.description ?? '',
                  variantType: TextVariantType.body2,
                  fontSize: 14,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 8),
                  child: TextVariant(
                    'Location',
                    variantType: TextVariantType.headline6,
                    fontSize: 12,
                    color: CustomColors.greyLiteColor,
                  ),
                ),
                TextVariant(
                  model.training!.address ?? '',
                  variantType: TextVariantType.body2,
                  fontSize: 14,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 8),
                  child: TextVariant(
                    'Date & Time',
                    variantType: TextVariantType.headline6,
                    fontSize: 12,
                    color: CustomColors.greyLiteColor,
                  ),
                ),
                TextVariant(
                  UtilsHelper.getTrainingDate(
                      model.training!.startDate, model.training!.endDate),
                  variantType: TextVariantType.body2,
                  fontSize: 14,
                ),
                TextVariant(
                  UtilsHelper.getTrainingTime(
                          model.training!.startTime, model.training!.endTime)
                      .toLowerCase(),
                  variantType: TextVariantType.body2,
                  fontSize: 12,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
