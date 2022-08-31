import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/view/widgets/logo.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    // _emailTextController.text = 'danilloilggner@gmail.com';
    // _passwordTextController.text = 'senhatemp123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: 8),
              Text('Bem vindo!', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 8),
              BlocProvider(
                create: (context) =>
                    LoginFormCubit(context.read<AuthRepository>()),
                child: Form(
                  key: _formKey,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LoginForm(),
                    // child: Column(
                    //   children: const [
                    // ref.watch(authNotifierProvider) ==
                    //         const AuthState.loggingIn()
                    //     ? const CircularProgressIndicator()
                    //     : ElevatedButton(
                    //         onPressed: () {
                    //           if (_formKey.currentState!.validate()) {
                    //             ref
                    //                 .read(authNotifierProvider.notifier)
                    //                 .login(
                    //                   Account(
                    //                     email: _emailTextController.text,
                    //                     senha: _passwordTextController.text,
                    //                   ),
                    //                 );
                    //           }
                    //         },
                    //         child: const Text('Login')),
                    //   ],
                    // ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
}
