import 'package:flutter/material.dart';
import 'package:flutter_interview_task/presentation/styles/colors.dart';
import 'package:flutter_interview_task/presentation/viewmodels/home.viewmodel.dart';
import 'package:flutter_interview_task/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter_interview_task/presentation/views/widgets/views/bottom.swipe.view.dart';
import 'package:flutter_interview_task/presentation/views/widgets/views/compound_training.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return HomeMainViewModel.buildWithProvider(builder: (_, __) {
      return _HomeBody(
        title: title,
      );
    });
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    HomeMainViewModel model = HomeMainViewModel.provide(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: 150,
                  collapsedHeight: 150,
                  elevation: 0,
                  title: TextVariant(
                    title,
                    variantType: TextVariantType.appBarTitle,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  iconTheme:
                      IconTheme.of(context).copyWith(color: Colors.white),
                  actions: <Widget>[
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                  ],
                  backgroundColor: AppColors.primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(16),
                      child: TextVariant(
                        'Highlights',
                        variantType: TextVariantType.headline6,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                )),
            SliverPersistentHeader(pinned: true, delegate: BottomSwipeView())
          ];
        },
        body: model.isBlocked
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeMainViewModel model = HomeMainViewModel.provide(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return TrainingWidget(
              training: model.trainings![index],
              onPressed: () {
                model.navigateToTraining(context, model.trainings![index]);
              },
            );
          }, childCount: model.trainings!.length),
        )
      ],
    );
  }
}
