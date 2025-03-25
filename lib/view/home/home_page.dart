import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewModel/home_events_view_model.dart';
import 'widgets/home_events_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("홈")),
      body: FutureBuilder(
        future: Provider.of<HomeViewModel>(context, listen: false).loadEvents(),
        builder: (context, snapshot) {
          // 로딩 상태 처리
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // 데이터를 받아와서 이벤트 목록을 표시
          final events = Provider.of<HomeViewModel>(context).events;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (context, index) {
              return HomeCard(event: events[index]);
            },
          );
        },
      ),
    );
  }
}
