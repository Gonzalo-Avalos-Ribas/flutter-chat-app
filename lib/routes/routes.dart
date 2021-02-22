import 'package:chattiemporeal/pages/chat_page.dart';
import 'package:chattiemporeal/pages/loading_page.dart';
import 'package:chattiemporeal/pages/login_page.dart';
import 'package:chattiemporeal/pages/register_page.dart';
import 'package:chattiemporeal/pages/usuarios_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'chat': (_) => ChatPage(),
  'loading': (_) => LoadingPage(),
};
