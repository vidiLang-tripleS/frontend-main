import 'package:flutter/material.dart';
import 'package:vidilang/theme.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.15,
            right: screenWidth * 0.15,
            child: LoginHeaderLogo(),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.w700,
                  color: AppColors.font,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.3,
            left: 0,
            right: 0,
            child: SignupForm(),
          ),
        ],
      ),
    );
  }
}

//비번 조건: 최소8자, 1개 이상 대문자, 숫자, 특수문자 포함
class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isValidEmail = false;
  bool _hasInputEmail = false;
  bool _isValidPassword = false;
  bool _hasInputPassword = false;
  bool _isPasswordVisible = false;

  void _validateEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|net|org|gov|edu|mil|int|biz|info|kr|co\.[a-zA-Z]{2,})$');

    setState(() {
      _hasInputEmail = email.isNotEmpty;
      _isValidEmail = emailRegex.hasMatch(email);
    });
  }

  void _validatePassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    setState(() {
      _hasInputPassword = password.isNotEmpty;
      _isValidPassword = passwordRegex.hasMatch(password);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          label: "닉네임",
          controller: _nicknameController,
          hintText: "닉네임을 입력 해주세요",
        ),
        SizedBox(height: screenWidth * 0.03),
        CustomTextField(
          label: "이메일",
          controller: _emailController,
          hintText: "이메일을 입력 해주세요",
          onChanged: _validateEmail,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.15, top: 5),
            child: SizedBox(
              height: 15,
              child: _hasInputEmail
                  ? (_isValidEmail
                      ? Text(
                          "Valid email",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFA0C97D),
                          ),
                        )
                      : Text(
                          "Enter valid email",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                        ))
                  : SizedBox(),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.0004),
        CustomTextField(
          label: "비밀번호",
          controller: _passwordController,
          hintText: "비밀번호를 입력 해주세요",
          onChanged: _validatePassword,
          obscureText: !_isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.15, top: 5),
            child: SizedBox(
              height: 15,
              child: _hasInputPassword
                  ? (_isValidPassword
                      ? Text(
                          "Valid password",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFA0C97D),
                          ),
                        )
                      : Text(
                          "Enter valid password",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                        ))
                  : SizedBox(),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.08),
        SignupButton(),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  CustomTextField({
    required this.label,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          width: screenWidth * 0.75,
          height: screenWidth * 0.13,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: suffixIcon ?? SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFEB5757),
        minimumSize: Size(screenWidth * 0.6, screenWidth * 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        "회원가입",
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}
