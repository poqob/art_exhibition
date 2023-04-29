import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/data/db/bloc/authentication/bloc_authentication.dart';
import 'package:art_exhibition/data/db/bloc/authentication/states_authentication.dart';
import 'package:art_exhibition/screens/authentaticion/widgets/l_Initt.dart';
import 'package:art_exhibition/screens/authentaticion/widgets/l_error.dart';
import 'package:art_exhibition/screens/authentaticion/widgets/l_showAlert.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: buildScaffold(),
    );
  }

  @Todo(
    "i have pixel overflow issue when keyboard appears, i'll take care of it.",
  )
  Scaffold buildScaffold() {
    return Scaffold(
      backgroundColor: ConstantBackroundColors.colorLogin.getColor,
      appBar: AppBar(),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _stateBuilder(state, context);
        },
      ),
    );
  }

  // call sub widgets according to AuthenticationState
  Widget _stateBuilder(AuthenticationState state, BuildContext context) {
    if (state is AuthenticationInitial) {
      return initView(context);
    } else if (state is AuthenticationAuthing) {
      return const Loading();
    } else if (state is AuthenticationError) {
      return errorView(context);
    } else {
      //navigate to main screen.
      return showAlert(context);
    }
  }
}
