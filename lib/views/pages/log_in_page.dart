import 'package:elepro/utils/session_helper.dart';
import 'package:elepro/utils/style_helper.dart';
import 'package:elepro/views/pages/navigation_page.dart';
import 'package:elepro/views/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmailAddress = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  login() {
    // Eksekusi request Log in
    Map dataUser = {
      'email': 'elepro@email.com',
    };
    Session.saveUser(dataUser);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/logo.png',
                    width: 64,
                    height: 64,
                  ),
                  form(),
                  Wrap(
                    spacing: 4,
                    children: [
                      Text('Belum punya akun?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Daftar',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Style.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card form() => Card(
        margin: const EdgeInsets.all(16),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controllerEmailAddress,
                  validator: (value) =>
                      value == '' ? "Silakan isi alamat surel" : null,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Style.grey,
                    ),
                    hintText: 'johndoe@email.com',
                    labelText: 'Alamat Surel',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controllerPassword,
                  obscureText: _passwordVisible,
                  validator: (value) =>
                      value == '' ? "Silakan isi kata sandi" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Style.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Style.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    hintText: '********',
                    labelText: 'Kata Sandi',
                  ),
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Lupa Kata Sandi?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Style.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => login(),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        Icon(Icons.login_outlined),
                        Text('Masuk'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
