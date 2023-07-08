import 'package:crm_sahel_telecom/config/palette.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart' as material;
import '../api/service_api.dart';
import '../provider/auth_provider.dart';
import '../widget/windows_app_bar.dart';
import 'package:bilions_ui/bilions_ui.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var service = ServiceApi();
  var email = TextEditingController();
  var password = TextEditingController();
  bool forgetPass = true;
  bool showContactAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WindowsAppBar(),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Palette.ligthBg,
                image: DecorationImage(
                    image: AssetImage('assets/pattern.png'),
                    fit: BoxFit.cover)),
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 400.0,
                      height: 470.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/callback.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Container(
                      width: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 2.0,
                              offset: const Offset(1, 0))
                        ],
                      ),
                      child: Consumer<AuthProvider>(
                          builder: (context, value, child) => Column(
                                children: [
                                  Visibility(
                                    visible: showContactAdmin,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ListTile(
                                            trailing: IconButton(
                                                icon: const Icon(
                                                    material.Icons.close,
                                                    color: Palette.red),
                                                onPressed: () {
                                                  showContactAdmin =
                                                      !showContactAdmin;
                                                  forgetPass = false;
                                                  setState(() {});
                                                }),
                                          ),
                                          const SizedBox(height: 15.0),
                                          Image.asset("assets/logo.png",
                                              width: 80.0),
                                          const SizedBox(height: 15.0),
                                          const Text(
                                            "Contacter un Administrateur",
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 25.0),
                                          TextBox(
                                            highlightColor: Palette.secondColor,
                                            controller: email,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            placeholder: 'Entrez votre E-mail',
                                            expands: false,
                                          ),
                                          const SizedBox(height: 50.0),
                                          Visibility(
                                              visible:
                                                  !value.connexionIsLoading!,
                                              child: PrimaryButton(
                                                color: Palette.secondColor,
                                                'Envoyer',
                                                width: 250.0,
                                                onPressed: () {
                                                  if (email.text.isNotEmpty ||
                                                      password
                                                          .text.isNotEmpty) {
                                                    if (forgetPass) {
                                                      Provider.of<AuthProvider>(
                                                              context,
                                                              listen: false)
                                                          .changeValConnexionIsLoading(
                                                              true);
                                                      service.connexion(
                                                          context: context,
                                                          email:
                                                              email.text.trim(),
                                                          password:
                                                              password.text);
                                                    } else {
                                                      service.forgetPass(
                                                          context: context,
                                                          email: email.text
                                                              .trim());
                                                    }

                                                    if (showContactAdmin) {
                                                      service.contacterAdmin(
                                                          email: email.text);
                                                    }
                                                  } else {
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (context) =>
                                                          ContentDialog(
                                                        content: const Text(
                                                            "Entrez un e-mail et un mot de passe svp!",
                                                            style: TextStyle(
                                                                fontSize: 25.0),
                                                            textAlign: TextAlign
                                                                .center),
                                                        actions: [
                                                          FilledButton(
                                                            child: const Text(
                                                                'Fermer'),
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                },
                                              )),
                                          const SizedBox(height: 100.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !showContactAdmin,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 15.0),
                                          Image.asset(
                                            "assets/logo.png",
                                            width: 80.0,
                                          ),
                                          const SizedBox(height: 15.0),
                                          const Text(
                                            "BIENVENU SUR MBOUOLEY",
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 25.0),
                                          TextBox(
                                            highlightColor: Palette.secondColor,
                                            controller: email,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            placeholder: 'E-mail',
                                            expands: false,
                                          ),
                                          const SizedBox(height: 15.0),
                                          Visibility(
                                            visible: forgetPass,
                                            child: Column(
                                              children: [
                                                PasswordBox(
                                                  highlightColor:
                                                      Palette.secondColor,
                                                  controller: password,
                                                  placeholder: "Mot de passe",
                                                ),
                                                const SizedBox(height: 15.0),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: forgetPass,
                                            child: Row(
                                              children: [
                                                HyperlinkButton(
                                                  child: const Text(
                                                      "Mot de passe oublié?",
                                                      style: TextStyle(
                                                          color: Palette
                                                              .primaryColor)),
                                                  onPressed: () {
                                                    setState(() {
                                                      forgetPass = !forgetPass;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: !forgetPass,
                                            child: Row(
                                              children: [
                                                HyperlinkButton(
                                                  child: const Text(
                                                      "Se connecter",
                                                      style: TextStyle(
                                                          color: Palette
                                                              .primaryColor)),
                                                  onPressed: () {
                                                    setState(() {
                                                      password.clear();
                                                      forgetPass = !forgetPass;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 15.0),
                                          SelectableText.rich(onTap: () {
                                            setState(() {
                                              showContactAdmin =
                                                  !showContactAdmin;
                                            });
                                          },
                                              const TextSpan(
                                                  text:
                                                      "Vous n'avez pas encore de compte ? ",
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            "Contactez un admin ! ",
                                                        style: TextStyle(
                                                            color: Palette
                                                                .primaryColor,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline))
                                                  ])),
                                          const SizedBox(height: 30.0),
                                          Visibility(
                                              visible:
                                                  value.connexionIsLoading!,
                                              child: Lottie.asset(
                                                  'assets/lotties/loading.json',
                                                  width: 200.0)),
                                          Visibility(
                                              visible:
                                                  !value.connexionIsLoading!,
                                              child: PrimaryButton(
                                                color: Palette.secondColor,
                                                forgetPass
                                                    ? 'Se connecter'
                                                    : 'Valider',
                                                width: 250.0,
                                                onPressed: () {
                                                  if (email.text.isNotEmpty ||
                                                      password
                                                          .text.isNotEmpty) {
                                                    if (forgetPass) {
                                                      Provider.of<AuthProvider>(
                                                              context,
                                                              listen: false)
                                                          .changeValConnexionIsLoading(
                                                              true);
                                                      service.connexion(
                                                          context: context,
                                                          email:
                                                              email.text.trim(),
                                                          password:
                                                              password.text);
                                                    } else {
                                                      service.forgetPass(
                                                          context: context,
                                                          email: email.text
                                                              .trim());
                                                    }
                                                  } else {
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (context) =>
                                                          ContentDialog(
                                                        content: const Text(
                                                          "Entrez un e-mail et un mot de passe svp!",
                                                          style: TextStyle(
                                                            fontSize: 25.0,
                                                          ),
                                                        ),
                                                        actions: [
                                                          FilledButton(
                                                            child: const Text(
                                                                'Fermer'),
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                },
                                              )),
                                          const SizedBox(height: 35.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
