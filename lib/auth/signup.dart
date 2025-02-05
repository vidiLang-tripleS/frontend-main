import 'package:flutter/material.dart';
import 'package:vidilang/auth/login.dart';
import 'package:vidilang/auth/signup.dart';
import 'package:vidilang/theme.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.08,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: screenWidth * 0.85,
                height: screenHeight * 0.08,
                child: LoginHeaderLogo(),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontSize: screenWidth * 0.132,
                  fontWeight: FontWeight.w700,
                  color: AppColors.font,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.32,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: screenHeight * 0.045),
                  NicknameField(),
                  SizedBox(height: screenHeight * 0.02),
                  EmailField(),
                  SizedBox(height: screenHeight * 0.0002),
                  PasswordField()
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: screenHeight * 0.009),
                  SizedBox(height: screenHeight * 0.015),
                  LoginButton(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.113,
            left: 0,
            right: 0,
            child: AccountSignUpText(),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 53,
      decoration: BoxDecoration(
        color: Color(0xFFEB5757),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.168),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.084),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          // 로그인 버튼 클릭 시 동작할 로직 추가
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "로그인",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class NicknameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "닉네임",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 5),
        Container(
          width: 325,
          height: 53,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 2),
                blurRadius: 3,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "닉네임을 입력 해주세요",
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0x4F4F4F).withOpacity(0.5),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmailField extends StatefulWidget {
  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = false;
  bool _hasInputEmail = false;

  void _validateEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

    setState(() {
      _hasInputEmail = email.isNotEmpty;
      _isValidEmail = emailRegex.hasMatch(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이메일",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 5),
        Container(
          width: 325,
          height: 53,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 2),
                blurRadius: 3,
              ),
            ],
          ),
          child: TextField(
            controller: _emailController,
            onChanged: _validateEmail,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "이메일을 입력 해주세요",
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0x4F4F4F).withOpacity(0.5),
                  ),
            ),
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: 325,
          height: 15,
          child: Align(
            alignment: Alignment.centerRight,
            child: Opacity(
              opacity: _hasInputEmail ? 1.0 : 0.0,
              child: Text(
                _isValidEmail ? "Valid email" : "Enter valid email",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: _isValidEmail ? Color(0xFFA0C97D) : Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isValidPassword = false;
  bool _hasInputPassword = false;
  bool _isPasswordVisible = false;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "비밀번호",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 5),
        Container(
          width: 325,
          height: 53,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 2),
                blurRadius: 3,
              ),
            ],
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            onChanged: _validatePassword,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "비밀번호를 입력 해주세요",
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0x4F4F4F).withOpacity(0.5),
                  ),
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
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: 325,
          height: 15,
          child: Align(
            alignment: Alignment.centerRight,
            child: Opacity(
              opacity: _hasInputPassword ? 1.0 : 0.0,
              child: Text(
                _isValidPassword ? "Valid password" : "Enter valid password",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: _isValidPassword ? Color(0xFFA0C97D) : Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AccountSignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 22),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "이미 계정이 있으신가요? ",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                "로그인",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.7),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
