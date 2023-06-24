import 'package:checklist/models/check_if_user_logged_in.dart';
import 'package:checklist/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AuthBody extends StatefulWidget {
  @override
  _AuthBodyState createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  Future<void> _submitSignIn() async {
    setState(() {
    });

    if (_formKey.currentState!.validate()) {
      try {

        setState(() {
          Provider.of<CheckIfUserLoggedIn>(context, listen: false)
              .changeState(true);
        });
      } catch (e) {
        setState(() {
        });
        print(e);
      }
    }
  }

  Future<void> _submitSignUp() async {
    setState(() {
    });

    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          Provider.of<CheckIfUserLoggedIn>(context, listen: false)
              .changeState(true);
        });
      } catch (e) {
        setState(() {
        });
        print(e);
      }
    }
  }

  Widget _buildLoginBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome Back,',
            style: TextStyle(
              fontSize: 25.5.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans',
            ),
          ),
          SizedBox(height: 3.0.h),
          Text(
            'Login to save your reminders on all devices.',
            style: TextStyle(
              fontSize: 16.0.sp,
              fontFamily: 'WorkSans',
              color: Colors.grey[500],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0.h),
            width: 200.0.w,
            height: 200.0.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CustomTextFormField(
                  labelText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                  errorText: 'Please input email address',
                  controller: _emailController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: CustomTextFormField(
                    labelText: 'Password',
                    obscureText: true,
                    errorText: 'Please input password',
                    controller: _passwordController, textInputType: TextInputType.visiblePassword,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    onTap: () {
                      //TODO: Add forget password body
                    },
                  ),
                ),
                SizedBox(height: 30.0.h),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 1.5,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      padding: EdgeInsets.only(
                        left: 15.0,
                        bottom: 11.0,
                        top: 11.0,
                        right: 15.0,
                      ),
                    ),
                    onPressed: _submitSignIn,
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                        ),
                      ),
                      onTap: () {
                        setState(() {
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Create Your Account,',
            style: TextStyle(
              fontSize: 25.5.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans',
            ),
          ),
          SizedBox(height: 3.0.h),
          Text(
            'Sign up and get started.',
            style: TextStyle(
              fontSize: 16.0.sp,
              fontFamily: 'WorkSans',
              color: Colors.grey[500],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
            width: 220.0.w,
            height: 220.0.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signup.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CustomTextFormField(
                  labelText: 'Name',
                  textInputType: TextInputType.name,
                  obscureText: false,
                  errorText: 'Please enter your name',
                  controller: _nameController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
                  child: CustomTextFormField(
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    errorText: 'Please input email address',
                    controller: _emailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomTextFormField(
                    labelText: 'Password',
                    obscureText: true,
                    errorText: 'Please input password',
                    controller: _passwordController, textInputType: TextInputType.visiblePassword,
                  ),
                ),
                SizedBox(height: 30.0.h),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 1.5,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.only(
                          left: 15.0,
                          bottom: 11.0,
                          top: 11.0,
                          right: 15.0,
                        ),
                      ),
                    ),
                    onPressed: _submitSignUp,
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                        ),
                      ),
                      onTap: () {
                        setState(() {
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 180.0.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
