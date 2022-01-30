import 'package:flutter/material.dart';
import 'package:flutter_interview_task/domain/data/models/home_swipe.model.dart';
import 'package:flutter_interview_task/presentation/styles/colors.dart';
import 'package:flutter_interview_task/presentation/styles/text_styles.dart';
import 'package:flutter_interview_task/presentation/viewmodels/highlight_detail.viewmodel.dart';
import 'package:flutter_interview_task/presentation/viewmodels/home.viewmodel.dart';
import 'package:flutter_interview_task/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter_interview_task/presentation/views/widgets/views/compound_training.dart';
import 'package:intl/intl.dart';

class HighLightDetailPage extends StatelessWidget {
  const HighLightDetailPage({Key? key, required this.highlight})
      : super(key: key);

  final Highlight highlight;

  @override
  Widget build(BuildContext context) {
    return HighlightDetailViewModel.buildWithProvider(
        builder: (_, __) {
          return const _HighLightDetailBody();
        },
        highlight: highlight);
  }
}

class _HighLightDetailBody extends StatelessWidget {
  const _HighLightDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HighlightDetailViewModel model = HighlightDetailViewModel.provide(context);
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
                      model.highlight!.title ?? '',
                      variantType: TextVariantType.headline6,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(model.highlight!.avatar!),
                              fit: BoxFit.cover)),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(16),
                      child: TextVariant(
                        model.highlight!.title ?? '',
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
            : const _HighlightDetailView(),
      ),
      bottomNavigationBar: Container(
        height: 56,
        decoration: const BoxDecoration(
            color: CustomColors.limeColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(16),
        child: RichText(
          text: TextSpan(
              text: '\$${model.highlight!.actualPrice.toString()}',
              style: TextStyles.labelStyle(context: context).copyWith(
                  color: Colors.red, decoration: TextDecoration.lineThrough),
              children: <TextSpan>[
                TextSpan(
                    text: ' \$${model.highlight!.price.toString()}',
                    style: TextStyles.labelStyle(context: context).copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 16))
              ]),
        ),
      ),
    );
  }
}

class _HighlightDetailView extends StatelessWidget {
  const _HighlightDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HighlightDetailViewModel model = HighlightDetailViewModel.provide(context);
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
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 8),
                  child: TextVariant(
                    'Description',
                    variantType: TextVariantType.headline6,
                    fontSize: 12,
                    color: CustomColors.greyLiteColor,
                  ),
                ),
                TextVariant(
                  model.highlight!.description ?? '',
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
                  model.highlight!.address ?? '',
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
                  '${DateFormat('dd-MMM').format(model.highlight!.startDate!)} - ${DateFormat('dd-MMM').format(model.highlight!.endDate!)}',
                  variantType: TextVariantType.body2,
                  fontSize: 14,
                ),
                TextVariant(
                  '${DateFormat('hh:mm a').format(model.highlight!.startDate!).toLowerCase()} - ${DateFormat('hh:mm a').format(model.highlight!.endDate!).toLowerCase()}',
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
