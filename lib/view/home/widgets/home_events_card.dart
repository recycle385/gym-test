import 'package:flutter/material.dart';
import '../../../model/home_events_card_model.dart';
import 'package:intl/intl.dart';

class HomeCard extends StatelessWidget {
  final HomeEvent event;

  const HomeCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Center(
      // HomeCard의 부모에서 카드 자체를 가운데 정렬
      child: SizedBox(
        height: 250,
        width: 270,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
              children: [
                // 이미지 추가
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    event.imageUrl,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
                    children: [
                      Text(
                        event.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 0),
                      Text(
                        event.location,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff7f7f7f),
                        ),
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: NumberFormat("#,###").format(event.price),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff7f7f7f),
                              ),
                              children: [
                                TextSpan(
                                  text: ' 원',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff7f7f7f),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(event.date),
                                  Text(event.time),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
