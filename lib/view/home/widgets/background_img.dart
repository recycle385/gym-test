import 'package:flutter/material.dart';

class BackgroundImg extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const BackgroundImg({
    super.key,
    required this.imagePath,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 배경 이미지 (230px까지만 보이도록 설정)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 230, // 이미지 높이를 230px로 제한
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // 이미지 하단에 투명 그라디언트 추가 (그라디언트가 흰색으로 이어짐)
        Positioned(
          top: 230, // 그라디언트가 230px 아래부터 시작
          left: 0,
          right: 0,
          height: double.infinity, // 남은 영역은 모두 그라디언트
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent, // 이미지 아래로 투명
                  Colors.white, // 그라디언트 아래는 흰색
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),

        // 자식 위젯들 (슬라이더, 텍스트 등)
        Positioned.fill(child: child),
      ],
    );
  }
}
