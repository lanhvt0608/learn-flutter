// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:section2/app/di.dart';
import 'package:section2/presentation/login/login_viewmodel.dart';
import 'package:section2/presentation/resources/assets_manager.dart';
import 'package:section2/presentation/resources/color_manager.dart';
import 'package:section2/presentation/resources/routes.manager.dart';
import 'package:section2/presentation/resources/strings_manager.dart';
import 'package:section2/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel =
      instance<LoginViewModel>(); // todo pass here login useCase

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController.addListener(() {
      _viewModel.setUserName(_userNameController.text);
    });
    _passwordController
        .addListener(() => {_viewModel.setPassword(_passwordController.text)});
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        padding: EdgeInsets.only(top: AppPadding.p100),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Image(
                image: AssetImage(ImageAssets.splashLogo),
              ),
              SizedBox(height: AppSize.s28),
              Padding(
                padding: EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputUserNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameController,
                      decoration: InputDecoration(
                          hintText: AppString.username,
                          labelText: AppString.username,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppString.usernameError),
                    );
                  },
                ),
              ),
              SizedBox(height: AppSize.s28),
              Padding(
                padding: EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputPasswordValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: AppString.password,
                          labelText: AppString.password,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppString.passwordError),
                    );
                  },
                ),
              ),
              SizedBox(height: AppSize.s40),
              Padding(
                padding: EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _viewModel.login();
                              }
                            : null,
                        child: Text(AppString.login),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p28,
                    right: AppPadding.p28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          AppString.forgetPassword,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.end,
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.registerRoute);
                        },
                        child: Text(
                          AppString.registerText,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
