class HomeEvent {
  final String name;
  final String location;
  final String imageUrl;
  final int price;
  final String date;
  final String time;

  HomeEvent({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.date,
    required this.time,
  });

  // Firebase에서 가져온 JSON 데이터를 객체로 변환
  factory HomeEvent.fromMap(Map<String, dynamic> map) {
    return HomeEvent(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'] ?? 0,
      date: map['date'] ?? '',
      time: map['time'] ?? '',
    );
  }
}
