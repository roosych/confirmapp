import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:test_app/screens/dashboard_screen.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/metak_gradient_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController persid = TextEditingController(text: '100641');
  TextEditingController pincode = TextEditingController(text: 'password');
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f7f7),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'asset/images/logo.svg',
                width: 175,
              ),
              const SizedBox(height: 60),
              TextFormField(
                enableInteractiveSelection: false,
                controller: persid,
                cursorColor: metakRed,
                maxLength: 6,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(120, 165, 165, 162), width: 0.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: metakGrey, width: 0.0),
                  ),
                  errorStyle: const TextStyle(height: 0),
                  hintStyle: const TextStyle(
                    color: metakGrey,
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.only(
                    top: 0,
                  ),
                  hintText: 'ID',
                  counterText: "",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      'asset/images/fingerprint.svg',
                      width: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: pincode,
                obscureText: _obscureText,
                cursorColor: metakRed,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(120, 165, 165, 162), width: 0.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: metakGrey, width: 0.0),
                  ),
                  errorStyle: const TextStyle(height: 0),
                  hintStyle: const TextStyle(
                    color: metakGrey,
                  ),
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.only(
                    top: 0,
                  ),
                  hintText: 'Şifrə',
                  counterText: "",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      'asset/images/lock.svg',
                      width: 20,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: _togglePassword,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(
                        _obscureText
                            ? 'asset/images/eye.svg'
                            : 'asset/images/show.svg',
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              MetakGradientButton(
                width: MediaQuery.of(context).size.width,
                // onPressed: () => Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const DashboardScreen()),
                // ),
                onPressed: () {
                  //скрываем програмную клавиатуру
                  FocusScope.of(context).requestFocus(FocusNode());
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.error(
                      // backgroundColor: metakRed,
                      boxShadow: [],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      message: 'Şəxsi İD və ya şifrə yanlışdır!',
                      icon: Icon(
                        Icons.abc_sharp,
                        color: Colors.transparent,
                      ),
                    ),
                    dismissType: DismissType.onSwipe,
                    dismissDirection: [DismissDirection.endToStart],
                  );
                },
                // child: const SizedBox(
                //   height: 25,
                //   width: 25,
                //   child: CircularProgressIndicator(
                //     color: Colors.white,
                //   ),
                // ),
                child: const Text(
                  "Daxil ol",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
