import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/data/blocs/auth_bloc.dart';
import 'package:test_app/data/repositories/auth_repository.dart';
import 'package:test_app/di.dart';

//import 'package:test_app/ui/screens/dashboard_screen.dart';
import 'package:test_app/ui/theme/app_theme.dart';
import 'package:test_app/ui/widgets/metak_gradient_button.dart';
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
    String? deviceId;

    if (Platform.isAndroid) {
      var deviceDetails = await DeviceInfoPlugin().androidInfo;
      final androidId = deviceDetails.id;
      deviceId = androidId;
    } else if (Platform.isIOS) {
      var deviceDetails = await DeviceInfoPlugin().iosInfo;
      final iosId =
          deviceDetails.identifierForVendor ?? deviceDetails.systemName;
      deviceId = iosId;
    }

    setState(() {
      _deviceId = deviceId;
    });
  }

  void _auth(BuildContext context) {
    final username = _username.text;
    final password = _password.text;
    BlocProvider.of<AuthBloc>(context)
        .add(SignInEvent(username, password, _deviceId ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authRepository: getIt<AuthRepository>()),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xfff7f7f7),
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                Navigator.of(context).pushReplacementNamed('/dashboard');
              }
              if (state is AuthErrorState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    // backgroundColor: metakRed,
                    boxShadow: const [],
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    message: 'auth_error'.tr(),
                    icon: const Icon(
                      Icons.abc_sharp,
                      color: Colors.transparent,
                    ),
                  ),
                  dismissType: DismissType.onSwipe,
                  dismissDirection: [DismissDirection.endToStart],
                );
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
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
                      // maxLength: 6,
                      // keyboardType: const TextInputType.numberWithOptions(
                      //     signed: true, decimal: true),
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(120, 165, 165, 162),
                              width: 0.0),
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
                        hintText: 'Login',
                        counterText: "",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            'asset/images/logom.svg',
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
                              color: Color.fromARGB(120, 165, 165, 162),
                              width: 0.0),
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
                        hintText: 'password'.tr(),
                        counterText: '',
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
                    Flexible(
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthProgressState) {
                            return const SizedBox.square(
                                  dimension: 30.0,
                                  child: CircularProgressIndicator(),);
                          }
                          return MetakGradientButton(
                            width: MediaQuery.of(context).size.width,
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              _auth(context);
                            },
                            child: Text(
                              'sign_in'.tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('$_deviceId'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
