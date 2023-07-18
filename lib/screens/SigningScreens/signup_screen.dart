import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/services/firebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isValidate = false;
  bool obsecureText = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void signUpUser(bool isValidate) async {
    if (isValidate) {
      context.read<FirebaseAuthHelper>().signUpWithEmail(
          email: emailAddressController.text.toString(),
          password: passwordController.text.toString(),
          context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool validateEmail(String email) {
      // Regular expression pattern for email validation
      String emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

      RegExp regExp = RegExp(emailPattern);

      return regExp.hasMatch(email);
    }

    bool ValidatePassword(String password, String confirmPassword) {
      return password == confirmPassword;
    }

    ValidateForm() {
      if (nameController.text.isNotEmpty &&
          nameController.text.length > 2 &&
          emailAddressController.text.isNotEmpty &&
          validateEmail(emailAddressController.text.toString()) &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty &&
          ValidatePassword(passwordController.text.toString(),
              confirmPasswordController.text.toString())) {
        setState(() {
          isValidate = true;
        });
      } else {
        setState(() {
          isValidate = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Sign Up ",
          style: GoogleFonts.aBeeZee(
              fontSize: 18.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 18.h, right: 20.h, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textTitle("Name*"),
              customTextField(nameController, TextInputType.name, (value) {
                ValidateForm();
              }),
              textTitle("Email Address*"),
              customTextField(
                  emailAddressController, TextInputType.emailAddress, (value) {
                ValidateForm();
              }),
              textTitle("Password*"),
              customPasswordTextField(passwordController, (value) {
                ValidateForm();
              }),
              textTitle("Confirm Password*"),
              customPasswordTextField(confirmPasswordController, (value) {
                ValidateForm();
              }),
              textTitle("Phone*"),
              textTitle("Select Role*"),
              GestureDetector(
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    signUpUser(isValidate);
                  },
                  child: signUpButton())
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      margin: EdgeInsets.only(left: 20.h, right: 20.h),
      width: double.infinity,
      height: 35.h,
      decoration: BoxDecoration(
          color: isValidate ? more_page_button_color : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Center(
          child: Text(
        "Create Account",
        style: GoogleFonts.lato(color: Colors.white, fontSize: 15.sp),
      )),
    );
  }

  Widget customPasswordTextField(
      TextEditingController controller, ValueChanged<String> onchanged) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      height: 35.h,
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        textAlignVertical: TextAlignVertical.center,
        onChanged: onchanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 0, left: 8.h),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(5.0),
          ),
          suffixIcon: IconButton(
            icon: obsecureText
                ? Icon(
                    FontAwesomeIcons.eye,
                    color: Colors.grey,
                    size: 15.h,
                  )
                : Icon(
                    FontAwesomeIcons.eyeSlash,
                    color: Colors.grey,
                    size: 15.h,
                  ),
            onPressed: () {
              setState(() {
                obsecureText = !obsecureText;
              });
            },
          ),
        ),
      ),
    );
  }
}

Widget textTitle(String text,
    {bool isDetailsScreen = false, Color textcolor = greyshade700}) {
  return Padding(
      padding: isDetailsScreen
          ? EdgeInsets.only(bottom: 10.h)
          : EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: GoogleFonts.aBeeZee(
            fontSize: isDetailsScreen ? 15.sp : 17.sp,
            fontWeight: FontWeight.bold,
            color: textcolor),
      ));
}

Widget customTextField(TextEditingController controller,
    TextInputType textInputType, ValueChanged<String> onchanged,
    {bool IsDetailsScreen = false, String? Function(String?)? validator}) {
  return Container(
    margin: !IsDetailsScreen
        ? EdgeInsets.only(
            bottom: 14.0,
          )
        : EdgeInsets.zero,
    height: 35.h,
    child: TextFormField(
      onChanged: onchanged,
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 0, left: 8.h),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0, // Increase width for error border
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0, // Increase width for focused error border
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorStyle: const TextStyle(fontSize: 0.01),
      ),
    ),
  );
}
