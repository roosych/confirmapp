import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'asset/images/logo.svg',
                width: 165,
              ),
              const SizedBox(height: 60),
              TextFormField(
                cursorColor: metakRed,
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  counterText: "",
                  filled: true,
                  hintText: 'Şəxsi İD',
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 30),
              MaterialButton(
                elevation: 0,
                padding: const EdgeInsets.all(12),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: metakGrey,
                onPressed: showSnackBar,
                child: const Text(
                  "Daxil ol",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  ScaffoldFeatureController showSnackBar() {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        showCloseIcon: true,
        elevation: 0,
        backgroundColor: Colors.amber,
        behavior: SnackBarBehavior.floating,
        content: Text('data'),
      ),
    );
  }
}
