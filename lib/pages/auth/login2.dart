import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_simple_graphql_auth/auth/secure_store.dart';
import 'package:flutter_simple_graphql_auth/auth/type_def.dart';
import 'package:flutter_simple_graphql_auth/auth/user.dart';
import 'package:flutter_simple_graphql_auth/graphql/user.dart';
import 'package:flutter_simple_graphql_auth/widgets/custom_text_input.dart';
import 'package:graphql/client.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String routePath = '/login';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TokenStore store = SecureStore();
  late final MyAuthManager authManager;
  late final GraphQLClient client;

  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;

  String get _userName => _userNameController.text;

  String get _password => _passwordController.text;

  @override
  void initState() {
    authManager = context.read<MyAuthManager>();
    client = context.read<GraphQLClient>();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() async {
    if (_formKey.currentState!.validate()) {
      try {
        final TokenResponse response = await UserGQL.login(
          client,
          userName: _userName,
          password: _password,
        );

        Map<String, dynamic> decodedToken = JwtDecoder.decode(response.token);

        User user = User(
          name: decodedToken['name'],
          userName: decodedToken['userName'],
        );

        await store.saveTokens(
            token: response.token, refreshToken: response.refreshToken);
        authManager.onLogin(user);
      } catch (error) {
        print(error);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Either your username or password is incorrect!",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: LayoutBuilder(
        builder: (context, viewportConstraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: _loginForm(),
          );
        },
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: _userNameController,
                labelText: "Username",
                hintText: "Username",
                textInputAction: TextInputAction.next,
                validator: (username) {
                  if (username == null || username.isEmpty) {
                    return "Username needs to be entered.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: _passwordController,
                labelText: "Password",
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return "Password needs to be entered.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _onLoginPressed,
                child: const Text(
                  "Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
