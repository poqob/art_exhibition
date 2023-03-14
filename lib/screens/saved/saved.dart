// ignore_for_file: empty_catches, camel_case_types

import 'package:art_exhibition/data/saved_data/bloc.dart';
import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/data/saved_data/states.dart';
import 'package:art_exhibition/utilities/extension_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedCubit(),
      child: _body(context),
    );
  }

  Scaffold _body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SavedCubit, SavedStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SavedInitial) {
            context.read<SavedCubit>().getSavedContents();
            return const _loading();
          } else if (state is SavedLoading) {
            return const _loading();
          } else {
            return _loaded(context, state);
          }
        },
      ),
    );
  }

  Center _loaded(BuildContext context, SavedStates state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Saved Content Count ${(state as SavedLoaded).content.length}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () {
              Content content =
                  Content('baslik', ['ssss', 1], 'imgPath', 'contentText');
              context.read<SavedCubit>().getSavedContents().then(
                (value) {
                  try {
                    var list = value;
                    list.add(content);
                    context.read<SavedCubit>().saveContent(list);
                  } catch (e) {}
                },
              );
            },
            child: const Text('add'),
          ),
          context.dynamicHeightWidget(0.01),
          ElevatedButton(
            onPressed: () {
              Content content =
                  Content('baslik', ['ssss', 1], 'imgPath', 'contentText');
              context.read<SavedCubit>().getSavedContents().then(
                (value) {
                  try {
                    var list = value;
                    list.any(
                      (element) => element.hashCode == content.hashCode
                          ? list.remove(element)
                          : false,
                    );
                    context.read<SavedCubit>().saveContent(list);
                  } catch (e) {}
                },
              );
            },
            child: const Text('remove'),
          ),
        ],
      ),
    );
  }
}

class _loading extends StatelessWidget {
  const _loading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
