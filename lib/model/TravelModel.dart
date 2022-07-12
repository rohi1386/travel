class TravelModel {
  String name;
  String location;
  String image;
  String distance;
  String temp;
  String rating;
  String discription;
  String price;

  TravelModel({
    required this.name,
    required this.location,
    required this.image,
    required this.distance,
    required this.temp,
    required this.rating,
    required this.discription,
    required this.price,
  });
}

List<TravelModel> travelList = [
  TravelModel(name: "ایلام", location: "غرب کشور", image: 'assets/img/ilam.png', distance: "7", temp: "30", rating: "5", discription: "discriphnhfntion", price: "20.000"),
  TravelModel(name: "تهران", location: "پاییتخت کشور", image: 'assets/img/tehran.png', distance: "8", temp: "20", rating: "10", discription: "discriphnhfntion", price: "45.000"),
  TravelModel(name: "کرمانشاه", location: "غرب کشور2", image: 'assets/img/kermanshah.png', distance: "14", temp: "10", rating: "12", discription: "discriphnhfntion", price: "26.000"),
  TravelModel(name: "کردستان", location: "شمال غربی کشور", image: 'assets/img/kord.png', distance: "25", temp: "13", rating: "7", discription: "discriphnhfntion", price: "10.000"),
];