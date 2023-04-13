import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/auth.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/servises/model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  // const LandingPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final UserModel? userModel = Provider.of<UserModel?>(context);
    final bool check = userModel != null;
    return check ? HomePage() : AuthPage();
  }
}