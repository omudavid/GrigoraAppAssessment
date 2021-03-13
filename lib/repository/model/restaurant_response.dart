class RestaurantsResponse {
  List<Cuisines> _cuisines;
  List<Promos> _promos;
  List<Restaurants> _restaurants;

  List<Cuisines> get cuisines => _cuisines;
  List<Promos> get promos => _promos;
  List<Restaurants> get restaurants => _restaurants;

  RestaurantsResponse(
      {List<Cuisines> cuisines,
      List<Promos> promos,
      List<Restaurants> restaurants}) {
    _cuisines = cuisines;
    _promos = promos;
    _restaurants = restaurants;
  }

  RestaurantsResponse.fromJson(dynamic json) {
    if (json["cuisines"] != null) {
      _cuisines = [];
      json["cuisines"].forEach((v) {
        _cuisines.add(Cuisines.fromJson(v));
      });
    }
    if (json["promos"] != null) {
      _promos = [];
      json["promos"].forEach((v) {
        _promos.add(Promos.fromJson(v));
      });
    }
    if (json["restaurants"] != null) {
      _restaurants = [];
      json["restaurants"].forEach((v) {
        _restaurants.add(Restaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_cuisines != null) {
      map["cuisines"] = _cuisines.map((v) => v.toJson()).toList();
    }
    if (_promos != null) {
      map["promos"] = _promos.map((v) => v.toJson()).toList();
    }
    if (_restaurants != null) {
      map["restaurants"] = _restaurants.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name : "Skipper Fast Food"
/// french_name : "Skipper Fast Food"
/// image : "https://gnet1.s3.us-east-2.amazonaws.com/1615197515_Screenshot_20210305-191819.jpg"
/// address : "Adetokunbo Ademola Crescent, Abuja, Nigeria, Federal Capital Territory"
/// french_address : "Croissant Adetokunbo Ademola, Abuja, Nigéria, Territoire de la capitale fédérale"
/// pickup : "0"
/// preparing_time : 25
/// table_booking : "0"
/// busy_status : false
/// no_of_seats : null
/// average_rating : 4
/// total_rating : 54

class Restaurants {
  int _id;
  String _name;
  String _frenchName;
  String _image;
  String _address;
  String _frenchAddress;
  String _pickup;
  int _preparingTime;
  String _tableBooking;
  bool _busyStatus;
  dynamic _noOfSeats;
  int _averageRating;
  int _totalRating;

  int get id => _id;
  String get name => _name;
  String get frenchName => _frenchName;
  String get image => _image;
  String get address => _address;
  String get frenchAddress => _frenchAddress;
  String get pickup => _pickup;
  int get preparingTime => _preparingTime;
  String get tableBooking => _tableBooking;
  bool get busyStatus => _busyStatus;
  dynamic get noOfSeats => _noOfSeats;
  int get averageRating => _averageRating;
  int get totalRating => _totalRating;

  Restaurants(
      {int id,
      String name,
      String frenchName,
      String image,
      String address,
      String frenchAddress,
      String pickup,
      int preparingTime,
      String tableBooking,
      bool busyStatus,
      dynamic noOfSeats,
      int averageRating,
      int totalRating}) {
    _id = id;
    _name = name;
    _frenchName = frenchName;
    _image = image;
    _address = address;
    _frenchAddress = frenchAddress;
    _pickup = pickup;
    _preparingTime = preparingTime;
    _tableBooking = tableBooking;
    _busyStatus = busyStatus;
    _noOfSeats = noOfSeats;
    _averageRating = averageRating;
    _totalRating = totalRating;
  }

  Restaurants.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _frenchName = json["french_name"];
    _image = json["image"];
    _address = json["address"];
    _frenchAddress = json["french_address"];
    _pickup = json["pickup"];
    _preparingTime = json["preparing_time"];
    _tableBooking = json["table_booking"];
    _busyStatus = json["busy_status"];
    _noOfSeats = json["no_of_seats"];
    _averageRating = json["average_rating"];
    _totalRating = json["total_rating"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["french_name"] = _frenchName;
    map["image"] = _image;
    map["address"] = _address;
    map["french_address"] = _frenchAddress;
    map["pickup"] = _pickup;
    map["preparing_time"] = _preparingTime;
    map["table_booking"] = _tableBooking;
    map["busy_status"] = _busyStatus;
    map["no_of_seats"] = _noOfSeats;
    map["average_rating"] = _averageRating;
    map["total_rating"] = _totalRating;
    return map;
  }
}

/// id : 5
/// name : "WELCOME PROMO"
/// image : "https://grigora.net/images/promo/1596661950.JPG"
/// french_name : "BIENVENUE PROMO"
/// description : "Welcome promo for new customers on orders above 500 from this restaurant"
/// french_description : "Promo de bienvenue pour les nouveaux clients sur les commandes supérieures à 500 dans ce restaurant"
/// code : "WELCOME20"

class Promos {
  int _id;
  String _name;
  String _image;
  String _frenchName;
  String _description;
  String _frenchDescription;
  String _code;

  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get frenchName => _frenchName;
  String get description => _description;
  String get frenchDescription => _frenchDescription;
  String get code => _code;

  Promos(
      {int id,
      String name,
      String image,
      String frenchName,
      String description,
      String frenchDescription,
      String code}) {
    _id = id;
    _name = name;
    _image = image;
    _frenchName = frenchName;
    _description = description;
    _frenchDescription = frenchDescription;
    _code = code;
  }

  Promos.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _image = json["image"];
    _frenchName = json["french_name"];
    _description = json["description"];
    _frenchDescription = json["french_description"];
    _code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["image"] = _image;
    map["french_name"] = _frenchName;
    map["description"] = _description;
    map["french_description"] = _frenchDescription;
    map["code"] = _code;
    return map;
  }
}

/// id : 60
/// name : "Bakery & Cakes"
/// french_name : "Boulangerie &amp; Gâteaux"
/// description : "Bakery & Cakes"
/// french_description : "Boulangerie &amp; Gâteaux"
/// image : "https://gnet1.s3.us-east-2.amazonaws.com/1613828537_Hummingbird-Cake-3.jpg"
/// icon : "https://gnet1.s3.us-east-2.amazonaws.com/1607076660_Bakery2.png"
/// background_icon : "https://gnet1.s3.us-east-2.amazonaws.com/1607076660_Bakery3.png"
/// status : "1"
/// created_at : "2020-04-16 11:39:24"
/// updated_at : "2021-02-20 13:42:17"
/// selected : false

class Cuisines {
  int _id;
  String _name;
  String _frenchName;
  String _description;
  String _frenchDescription;
  String _image;
  String _icon;
  String _backgroundIcon;
  String _status;
  String _createdAt;
  String _updatedAt;
  bool _selected;

  int get id => _id;
  String get name => _name;
  String get frenchName => _frenchName;
  String get description => _description;
  String get frenchDescription => _frenchDescription;
  String get image => _image;
  String get icon => _icon;
  String get backgroundIcon => _backgroundIcon;
  String get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  bool get selected => _selected;

  Cuisines(
      {int id,
      String name,
      String frenchName,
      String description,
      String frenchDescription,
      String image,
      String icon,
      String backgroundIcon,
      String status,
      String createdAt,
      String updatedAt,
      bool selected}) {
    _id = id;
    _name = name;
    _frenchName = frenchName;
    _description = description;
    _frenchDescription = frenchDescription;
    _image = image;
    _icon = icon;
    _backgroundIcon = backgroundIcon;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _selected = selected;
  }

  Cuisines.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _frenchName = json["french_name"];
    _description = json["description"];
    _frenchDescription = json["french_description"];
    _image = json["image"];
    _icon = json["icon"];
    _backgroundIcon = json["background_icon"];
    _status = json["status"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _selected = json["selected"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["french_name"] = _frenchName;
    map["description"] = _description;
    map["french_description"] = _frenchDescription;
    map["image"] = _image;
    map["icon"] = _icon;
    map["background_icon"] = _backgroundIcon;
    map["status"] = _status;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["selected"] = _selected;
    return map;
  }
}
