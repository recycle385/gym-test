import 'package:flutter/material.dart';

class SliderWithIndicator extends StatefulWidget {
  const SliderWithIndicator({super.key});

  @override
  _SliderWithIndicatorState createState() => _SliderWithIndicatorState();
}

class _SliderWithIndicatorState extends State<SliderWithIndicator> {
  final List<String> images = [
    'assets/events.jpg',
    'assets/events.jpg',
    'assets/events.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView를 사용하여 이미지를 슬라이드 형식으로 표시
        Padding(
          padding: const EdgeInsets.only(left: 270, top: 10),
          child: TextButton(
            style: TextButton.styleFrom().copyWith(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: Text(
              '전체보기 >',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 175, // 슬라이드 배너의 높이
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
        // 인디케이터 표시
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _currentIndex == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.blue
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
