import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_task/domain/data/models/country.model.dart';
import 'package:flutter_interview_task/domain/data/models/home_list.model.dart';
import 'package:flutter_interview_task/presentation/styles/colors.dart';
import 'package:flutter_interview_task/presentation/styles/text_styles.dart';
import 'package:flutter_interview_task/presentation/viewmodels/home_filter.viewmodel.dart';
import 'package:flutter_interview_task/presentation/views/widgets/custom/text_variant.dart';

class HomeFilterPage extends StatelessWidget {
  const HomeFilterPage({Key? key, this.filterObj}) : super(key: key);

  final FilterObj? filterObj;

  @override
  Widget build(BuildContext context) {
    return HomeFilterViewModel.buildWithProvider(
        builder: (_, __) {
          return const _HomeFilterBody();
        },
        filter: filterObj);
  }
}

class _HomeFilterBody extends StatelessWidget {
  const _HomeFilterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeFilterViewModel model = HomeFilterViewModel.provide(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: const TextVariant(
          'Sort and Filters',
          variantType: TextVariantType.headline6,
          fontSize: 18,
        ),
        actions: [
          Visibility(
            visible: model.filterCountry.isNotEmpty ||
                model.filterTrainer.isNotEmpty ||
                model.filterTrainingTitles.isNotEmpty,
            child: TextButton(
                onPressed: () {
                  model.applyFilter(context);
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.primaryColor),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                  child: const TextVariant('Apply',
                      variantType: TextVariantType.body2,
                      fontSize: 12,
                      color: Colors.white),
                )),
          ),
          IconButton(
              onPressed: () {
                model.onClose(context);
              },
              icon: const Icon(
                Icons.close,
                color: CustomColors.greyLiteColor,
              ))
        ],
      ),
      body: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width / 3,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 46,
                  color: model.selectedFilter == index
                      ? Colors.white
                      : CustomColors.limeColor.withOpacity(0.4),
                  child: InkWell(
                    onTap: () {
                      model.updateFilter(index);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 10,
                          color: model.selectedFilter == index
                              ? AppColors.primaryColor
                              : Colors.transparent,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: TextVariant(
                              model.filters[index],
                              fontSize: 14,
                              variantType: TextVariantType.body2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: model.filters.length,
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                const _Search(),
                model.getFilterViewDisplay()!,
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeFilterViewModel model = HomeFilterViewModel.provide(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: SizedBox(
        height: 46,
        child: TextFormField(
          controller: model.searchController,
          onChanged: (String args) {
            model.onSearch(args);
          },
          cursorHeight: 18,
          style: TextStyles.labelStyle(context: context)
              .copyWith(color: Colors.black),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide:
                      const BorderSide(color: CustomColors.greyLiteColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppColors.primaryColor)),
              prefixIconColor: CustomColors.greyLiteColor,
              suffixIconColor: CustomColors.greyLiteColor,
              hintText: 'Search',
              contentPadding: const EdgeInsets.all(8),
              hintStyle: TextStyles.hintStyle(context: context)
                  .copyWith(fontSize: 14)
                  .copyWith(color: CustomColors.greyLiteColor),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Visibility(
                visible: model.searchController.text.isNotEmpty,
                child: IconButton(
                    onPressed: () {
                      model.clearSearch();
                    },
                    icon: const Icon(Icons.close)),
              )),
        ),
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeFilterViewModel model = HomeFilterViewModel.provide(context);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        Country country = model.countries[index];
        return SizedBox(
          height: 46,
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: model.filterCountry
                .where((element) => element.id == country.id)
                .isNotEmpty,
            activeColor: AppColors.primaryColor,
            onChanged: (bool? value) {
              if (value != null) {
                model.updateLocation(value, country);
              }
            },
            title: TextVariant(
              country.name ?? '',
              variantType: TextVariantType.body2,
            ),
          ),
        );
      },
      itemCount: model.countries.length,
    );
  }
}

class TrainingTitle extends StatelessWidget {
  const TrainingTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeFilterViewModel model = HomeFilterViewModel.provide(context);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        String title = model.trainingTitles[index];
        return SizedBox(
          height: 46,
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: model.filterTrainingTitles
                .where((element) => element == title)
                .isNotEmpty,
            activeColor: AppColors.primaryColor,
            onChanged: (bool? value) {
              if (value != null) {
                model.updateTrainingTitle(value, title);
              }
            },
            title: TextVariant(
              title,
              variantType: TextVariantType.body2,
            ),
          ),
        );
      },
      itemCount: model.trainingTitles.length,
    );
  }
}

class Trainer extends StatelessWidget {
  const Trainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeFilterViewModel model = HomeFilterViewModel.provide(context);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        Speaker trainer = model.trainer[index];
        return SizedBox(
          height: 46,
          child: CheckboxListTile(
            value: model.filterTrainer
                .where((element) => element.id == trainer.id)
                .isNotEmpty,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.primaryColor,
            onChanged: (bool? value) {
              if (value != null) {
                model.updateTrainer(value, trainer);
              }
            },
            title: TextVariant(
              trainer.name ?? '',
              variantType: TextVariantType.body2,
            ),
          ),
        );
      },
      itemCount: model.trainer.length,
    );
  }
}
