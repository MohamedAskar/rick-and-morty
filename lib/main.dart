import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/view_model/character_view_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(charachterProvider);
    return Scaffold(body: _ui(viewModel));
  }

  _ui(CharachterViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (viewModel.error != null) {
      return Center(child: Text(viewModel.error!));
    }
    return ListView.builder(
      itemCount: viewModel.charachter.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => viewModel.getCharachter(gender: 'Male'),
          title: Text(viewModel.charachter[index].name),
          subtitle: Text(viewModel.charachter[index].status),
        );
      },
    );
  }
}
