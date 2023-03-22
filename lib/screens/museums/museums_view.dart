import 'package:art_exhibition/db/bloc/museum/bloc_museum.dart';
import 'package:art_exhibition/db/bloc/museum/states_museum.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class MuseumView extends StatelessWidget {
  const MuseumView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MuseumCubits(),
      child: const Page(),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MuseumCubits, MuseumStates>(
      listener: (BuildContext context, Object? state) {
        Logger().d(state);
      },
      builder: (BuildContext context, state) {
        if (state is MuseumInitial) {
          context.read<MuseumCubits>().getMuseums();
          return const Loading();
        } else if (state is MuseumLoading) {
          return const Loading();
        } else if (state is MuseumLoaded) {
          //convert readed data to list of Content() then send them to Body.
          return const Body();
        } else /*MuseumError situation*/ {
          return const ErrorWidget();
        }
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("log in failed"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/home");
            },
            child: const Text("re-try"))
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Museum",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
