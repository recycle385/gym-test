//import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/home_events_card_model.dart';

class HomeRepository {
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<HomeEvent>> fetchHomeEvents() async {
    // 🔥 실제 Firebase 요청을 사용하는 것처럼 보이게 하지만 더미 데이터를 반환
    await Future.delayed(Duration(seconds: 1)); // Firebase에서 로딩하는 것처럼 보이게

    // Firebase에서 가져온 것처럼 보이도록 더미 데이터 사용
    return [
      HomeEvent(
        name: "서울 풋살장",
        location: "서울 강남구",
        imageUrl: "assets/tennis.png",
        price: 30000,
        date: "2025.04.01 (월)",
        time: "18:00 ~ 20:00",
      ),
      HomeEvent(
        name: "한강 농구코트",
        location: "한강시민공원",
        imageUrl: "assets/tennis.png",
        price: 20000,
        date: "2025.04.02 (화)",
        time: "15:00 ~ 17:00",
      ),
      HomeEvent(
        name: "청운 농구코트",
        location: "청운시민공원",
        imageUrl: "assets/tennis.png",
        price: 10000,
        date: "2025.04.02 (화)",
        time: "15:00 ~ 17:00",
      ),
    ];
  }
}
