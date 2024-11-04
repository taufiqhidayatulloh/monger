import 'package:flutter/material.dart';
import 'package:monger/providers/name_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    color: Colors.white,
                    height: 500,
                    width: 400,
                    child: LoginMobile(),
                  ),
                ),
              ),
            );
          } else {
            return LoginMobile();
          }
        }),
      ),
    );
  }
}

class LoginMobile extends StatelessWidget {
  const LoginMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        // width: 127,
                        height: 24,
                        child: Image.asset(
                          'assets/images/logo/monger_logo_horizontal.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.shadow),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Log in to continue accessing your account and personalized features.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .shadow
                                    .withOpacity(0.6)),
                          ),
                          // Text(constraints.maxHeight.toString()),
                          // Text(constraints.maxWidth.toString()),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const LoginFormItem()
            ],
          ),
        );
      }),
    );
  }
}

class LoginFormItem extends StatefulWidget {
  const LoginFormItem({super.key});

  @override
  State<LoginFormItem> createState() => _LoginFormItemState();
}

class _LoginFormItemState extends State<LoginFormItem> {
  final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var nameState = Provider.of<NameProvider>(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Text(constraints.maxHeight.toString()),
          // Column(
          //   children: [
          //     MyInputField(
          //       label: "Username",
          //       hint: "Username",
          //       obscureText: false,
          //       controller: _usernameController,
          //       onChanged: (){},
          //     ),
          //   ],
          // ),

          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Username",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.shadow)),
            const SizedBox(
              height: 8,
            ),
            TextField(
              onChanged: (usernameController) {
                nameState.setName(usernameController);
              },
              controller: _usernameController,
              obscureText: false,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                hintText: "Username",
                hintStyle: TextStyle(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.3),
                    fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .shadow
                        .withOpacity(0.3), // Warna border
                    width: 2.0, // Ketebalan border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .shadow
                        .withOpacity(0.3), // Warna border ketika focused
                    width: 2.0,
                  ),
                ),
                filled: true, // Menambahkan warna background
                fillColor: Colors.white,
                // suffix: obscureText
                //     ? IconButton(
                //         onPressed: () {
                //           // setState(() {
                //           //   obscureText = false;
                //           // });
                //         },
                //         icon: Icon(Icons.remove_red_eye))
                //     : null,
              ),
            ),
          ]),

          // const SizedBox(height: 20),
          // MyInputField(label: "Password", hint: "Password", obscureText: true),
          GestureDetector(
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: _usernameController.text.isNotEmpty
                  ? BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(14),
                    )
                  : BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(14),
                    ),
              child: Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ),
            onTap: () {
              if (_usernameController.text.isNotEmpty) {
                nameState.setName(_usernameController.text);
                Navigator.pushNamed(
                  context,
                  '/homepage',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
