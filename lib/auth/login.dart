import 'package:flutter/material.dart';
import 'package:vidilang/home.dart';
import 'package:vidilang/auth/signup.dart';
import 'package:vidilang/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = true;
  bool _isLoginValid = true;
  bool _isPasswordEmpty = true;

  void _validateEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$');
    setState(() {
      _isEmailValid = emailRegex.hasMatch(email) || email.isEmpty;
    });
  }

  void _validatePassword(String password) {
    setState(() {
      _isPasswordEmpty = password.isEmpty;
      if (_isPasswordEmpty) {
        _isLoginValid = true;
      }
    });
  }

  // ✅ 로그인 로직 (임시)
  void _login() {
    String correctEmail = "test@example.com";
    String correctPassword = "password123";

    setState(() {
      _isLoginValid = _emailController.text == correctEmail &&
          _passwordController.text == correctPassword;
    });

    if (_isLoginValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          width: 430,
          height: 932,
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: [
              SizedBox(height: 36),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250.67,
                  height: 188,
                  child: Logo(),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmailField(
                      controller: _emailController,
                      isValid: _isEmailValid,
                      onChanged: _validateEmail,
                    ),
                    SizedBox(height: 5),
                    PasswordField(
                      controller: _passwordController,
                      isLoginValid: _isLoginValid,
                      onChanged: _validatePassword,
                    ),
                    SizedBox(height: 5),
                    if (_isPasswordEmpty || _isLoginValid) ForgotPasswordText(),
                    Spacer(),
                    AccountSignUpText(),
                    SizedBox(height: 10),
                    LoginButton(onPressed: _login),
                    SizedBox(height: 15),
                    LoginDivider(),
                    SizedBox(height: 15),
                    SocialLoginButtons(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final bool isValid;
  final Function(String) onChanged;

  EmailField({
    required this.controller,
    required this.isValid,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이메일",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF4F4F4F),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFBEBEBE),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(height: 1.0),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 18),
              border: InputBorder.none,
              hintText: "이메일을 입력해주세요",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0x4F4F4F).withOpacity(0.5),
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 16, // ✅ 에러 메시지가 없어도 높이 유지
          child: Visibility(
            visible: !isValid,
            child: Text(
              "잘못된 형식의 이메일입니다.",
              style: TextStyle(fontSize: 12, color: Color(0xFFEB5757)),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoginValid;
  final Function(String) onChanged;

  PasswordField({
    required this.controller,
    required this.isLoginValid,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "비밀번호",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF4F4F4F),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFBEBEBE), width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            obscureText: true,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 17, horizontal: 18),
              border: InputBorder.none,
              hintText: "8자리 이상으로 입력해주세요",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0x4F4F4F).withOpacity(0.5),
              ),
            ),
          ),
        ),
        if (!isLoginValid && controller.text.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: 5, top: 4),
            child: Text(
              "이메일이나 비밀번호를 다시 확인하세요.",
              style: TextStyle(fontSize: 12, color: Color(0xFFEB5757)),
            ),
          ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  LoginButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFFEB5757),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          "로그인",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AccountSignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "계정이 없으신가요? ",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4F4F4F),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            },
            child: Text(
              "회원가입",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4F4F4F),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/google_icon.svg',
            width: 45,
            height: 45,
          ),
        ),
        SizedBox(width: 20),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/kakao_icon.svg',
            width: 45,
            height: 45,
          ),
        ),
      ],
    );
  }
}

class LoginDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(thickness: 1, color: Color(0xFFBEBEBE)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "또는",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xFF4F4F4F),
            ),
          ),
        ),
        Expanded(
          child: Divider(thickness: 1, color: Color(0xFFBEBEBE)),
        ),
      ],
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text(
            "비밀번호를 잊으셨나요? ",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4F4F4F),
            ),
          ),
          GestureDetector(
            onTap: () {
              // 비밀번호 찾기 페이지로 이동하는 로직 추가
            },
            child: Text(
              "비밀번호 재설정",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4F4F4F),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
