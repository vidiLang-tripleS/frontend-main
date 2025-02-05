import 'package:flutter/material.dart';
import 'package:vidilang/auth/signup.dart';
import 'package:vidilang/theme.dart';

class Login extends StatelessWidget {
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
                '로그인',
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
                  EmailField(),
                  SizedBox(height: screenHeight * 0.02),
                  PasswordField(),
                  SizedBox(height: screenHeight * 0.01),
                  ForgotPasswordText(),
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
                  AccountSignUpText(),
                  SizedBox(height: screenHeight * 0.009),
                  LoginButton(),
                  SizedBox(height: screenHeight * 0.015),
                  GoogleLoginButton(),
                ],
              ),
            ),
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

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 53,
      decoration: BoxDecoration(
        color: Colors.white,
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
          // 구글 로그인 버튼 클릭 시 동작할 로직 추가
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/google_logo.png',
              width: 15,
              height: 15,
            ),
            SizedBox(width: 10),
            Text(
              "Google로 계속하기",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.font,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
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
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
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
            obscureText: true,
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
            ),
          ),
        ),
      ],
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 57, top: 8),
      child: Row(
        children: [
          Text(
            "비밀번호를 잊으셨나요? ",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          GestureDetector(
            onTap: () {
              // 비밀번호 찾기 페이지로 이동하는 로직 추가
            },
            child: Text(
              "비밀번호 찾기",
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
              "계정이 없으신가요? ",
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
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Text(
                "회원가입",
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
