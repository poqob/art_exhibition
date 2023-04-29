import 'package:art_exhibition/constants/constant_backround_color.dart';
import 'package:art_exhibition/data/db/bloc/authentication/bloc_authentication.dart';
import 'package:art_exhibition/data/db/bloc/authentication/states_authentication.dart';
import 'package:art_exhibition/screens/authentaticion/widgets/s_Init.dart';
import 'package:art_exhibition/screens/authentaticion/widgets/s_error.dart';
import 'package:art_exhibition/screens/authentaticion/widgets/s_showAlert.dart';
import 'package:art_exhibition/utilities/todo.dart';
import 'package:art_exhibition/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @Todo("ATENCION debug buton in appbar will be removed.")
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Scaffold(
        appBar: AppBar(actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text("debug button"))
        ]),
        backgroundColor: ConstantBackroundColors.colorSignup.getColor,
        body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return _stateBuilder(state, context);
          },
        ),
      ),
    );
  }
}

// initial state is non authing - free form state.
// when the button sign up clicked, state cycle starts and program starts to comminicate with db.
Widget _stateBuilder(AuthenticationState state, BuildContext context) {
  if (state is AuthenticationInitial) {
    return initView(context);
  } else if (state is AuthenticationAuthing) {
    return const Loading();
  } else if (state is AuthenticationError) {
    return showErrorDialog(context);
  } else {
    //navigate to main screen.
    return showSuccessAlert(context);
  }
}
