import 'package:cat_app/utils/debouncer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/utils/utils.dart';
import 'package:cat_app/services/services.dart';

import 'package:cat_app/ui/shared/cat_card.dart';
import 'package:cat_app/riverpods/home_page_riverpod/home_state.dart';

part '../views/home_views/home_view_mobile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeState);
    final notifier = ref.watch(homeState.notifier);

    _homeConfig(
      context: context,
      ref: ref,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.fullHeight(context),
          width: size.fullWidth(context),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1280) {
                return Container();
              } else {
                return HomeViewMobile(
                  catList: state.catList!,
                  goToDetail: notifier.goToCatDetail,
                  controller: notifier.searchController,
                  onChanged: notifier.isSearching,
                  isSearching: state.isSearching!,
                  matchSearch: notifier.matchSearch,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _homeConfig({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (ref.watch(homeState).catList!.isEmpty) {
        await ref.watch(homeState.notifier).getAllCats();
      }
    });
  }
}
