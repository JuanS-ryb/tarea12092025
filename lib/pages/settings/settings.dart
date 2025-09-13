import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import '../../data/notifiers.dart';
import 'change_lenguage.dart';
import 'info-page.dart';
import 'change_mail.dart';
import 'change-password.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: ValueListenableBuilder<bool>(
          valueListenable: isUsingDarkTheme,
          builder: (context, isDark, _) {
            return SettingsList(
              sections: [
                SettingsSection(
                  title: const Text('Informacion de cuenta'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: const Icon(Icons.mail),
                      title: const Text("Cambiar correo"),
                      value: ValueListenableBuilder(
                          valueListenable: mailNotifier,
                          builder: (context, mail, _) {
                            return Text(mail);
                          }),
                      onPressed: (context) {
                        // Acción al presionar
                        showChangeEmail(context);
                      },
                    ),
                    SettingsTile.navigation(
                      leading: const Icon(Icons.lock),
                      title: const Text('Change Password'),
                      onPressed: (context) {
                        showChangePassword(context);
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text("Personalizacion"),
                  tiles: [
                    SettingsTile.switchTile(
                      onToggle: (value) {
                        isUsingDarkTheme.value = value;
                      },
                      initialValue: isDark,
                      leading: const Icon(Icons.format_paint),
                      title: const Text('Tema oscuro'),
                    ),
                    SettingsTile(
                      leading: const Icon(Icons.language),
                      title: const Text("Idioma"),
                      onPressed: (context) {
                        showChangeLenguage(
                            context); // 👈 Pasas el contexto aquí
                      },
                      value: ValueListenableBuilder(
                          valueListenable: currentLenguage,
                          builder: (context, lenguage, _) {
                            return Text(lenguage);
                          }),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void showChangeEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InfoPage(
          title: "Cambiar Email",
          child: const ChangeEmailForm(), // widget stateful con el formulario
        ),
      ),
    );
  }

  void showChangePassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InfoPage(
          title: "Cambiar Email",
          child:
              const ChangePasswordForm(), // widget stateful con el formulario
        ),
      ),
    );
  }

  void showChangeLenguage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const InfoPage(
            title: "Cambiar idioma", child: LanguageSelector())));
  }
}
