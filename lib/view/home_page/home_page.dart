import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/text_style.dart';
import 'package:rick_and_morty/view/home_page/widgets/character_widget.dart';
import 'package:rick_and_morty/view/home_page/widgets/dialogs.dart';
import 'package:rick_and_morty/view/home_page/widgets/filter_widget.dart';
import 'package:rick_and_morty/view_model/character_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/view_model/providers.dart';

import 'widgets/Characteristics_form_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

final RefreshController _refreshController =
    RefreshController(initialRefresh: false);

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(charachterProvider);
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        title: Image.asset(
          'assets/img/logo.png',
          scale: 2,
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorUtils.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: ColorUtils.white,
        elevation: 0,
      ),
      body: _ui(context: context, viewModel: viewModel),
    );
  }

  _ui({required BuildContext context, required CharachterViewModel viewModel}) {
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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Consumer(builder: (context, ref, _) {
              final filter = ref.read(filterProvider);
              return Row(
                children: [
                  Text('Filters:', style: CustomTextStyle.dp14MedBlack),
                  if (filter['Status'] != null)
                    const FilterWidget(characteristic: 'Status'),
                  if (filter['Gender'] != null)
                    const FilterWidget(characteristic: 'Gender'),
                  const Spacer(),
                  IconButton(
                      onPressed: () => filterDialog(context: context),
                      icon: const Icon(Ionicons.options_outline))
                ],
              );
            }),
            ListView.builder(
              itemCount: viewModel.charachter.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CharacterWidget(
                  character: viewModel.charachter[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  
}

