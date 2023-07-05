import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:test_app/screens/dashboard_screen.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/metak_gradient_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? _deviceId;

  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDeviceId();
  }

  void _getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    if (Platform.isAndroid) {
      const androidId = AndroidId();
      deviceId = await androidId.getId();
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    }

    setState(() {
      _deviceId = deviceId;
    });
  }

  void _auth() {
    final username = _username.text;
    final password = _password.text;
    if (username == '100641' && password == '100641') {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    } else {
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
    }
    setState(() {});
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
                controller: _username,
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
                controller: _password,
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
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const DashboardScreen(),
                  //   ),
                  // );
                  _auth();
                },
                // onPressed: () {
                //   //скрываем програмную клавиатуру
                //   FocusScope.of(context).requestFocus(FocusNode());
                //   showTopSnackBar(
                //     Overlay.of(context),
                //     const CustomSnackBar.error(
                //       // backgroundColor: metakRed,
                //       boxShadow: [],
                //       borderRadius: BorderRadius.all(Radius.circular(8)),
                //       message: 'Şəxsi İD və ya şifrə yanlışdır!',
                //       icon: Icon(
                //         Icons.abc_sharp,
                //         color: Colors.transparent,
                //       ),
                //     ),
                //     dismissType: DismissType.onSwipe,
                //     dismissDirection: [DismissDirection.endToStart],
                //   );
                // },
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
              Text('$_deviceId'),
            ],
          ),
        ),
      ),
    );
  }
}
