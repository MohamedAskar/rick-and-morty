import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/view/home_page/widgets/character_widget.dart';
import 'package:rick_and_morty/view_model/character_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(charachterProvider);
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        title: const Text('Rick and Morty'),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorUtils.blue,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: ColorUtils.blue,
        elevation: 0,
      ),
      body: _ui(viewModel),
    );
  }

  _ui(CharachterViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (viewModel.error != null) {
      return Center(child: Text(viewModel.error!));
    }
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: () async {
        await viewModel.getCharachter();
        _refreshController.refreshCompleted();
      },
      onLoading: () async {
        await viewModel.getCharachter(isRefresh: false);
        _refreshController.loadComplete();
      },
      child: ListView.builder(
        itemCount: viewModel.charachter.length,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        itemBuilder: (context, index) {
          return CharacterWidget(
            character: viewModel.charachter[index],
          );
        },
      ),
    );
  }
}
