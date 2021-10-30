// To parse this JSON data, do
//
//     final joke = jokeFromJson(jsonString);

import 'dart:convert';

class Joke {
  Joke({
    required this.error,
    required this.category,
    required this.type,
    required this.setup,
    required this.delivery,
    required this.flags,
    required this.id,
    required this.safe,
    required this.lang,
  });

  bool error;
  String category;
  String type;
  String? setup;
  String? delivery;
  Flags flags;
  int id;
  bool safe;
  String lang;

  Joke copyWith({
    bool? error,
    String? category,
    String? type,
    String? setup,
    String? delivery,
    Flags? flags,
    int? id,
    bool? safe,
    String? lang,
  }) =>
      Joke(
        error: error ?? this.error,
        category: category ?? this.category,
        type: type ?? this.type,
        setup: setup ?? this.setup,
        delivery: delivery ?? this.delivery,
        flags: flags ?? this.flags,
        id: id ?? this.id,
        safe: safe ?? this.safe,
        lang: lang ?? this.lang,
      );

  factory Joke.fromRawJson(String str) => Joke.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
    error: json["error"],
    category: json["category"],
    type: json["type"],
    setup: json["setup"],
    delivery: json["delivery"],
    flags: Flags.fromJson(json["flags"]),
    id: json["id"],
    safe: json["safe"],
    lang: json["lang"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "category": category,
    "type": type,
    "setup": setup,
    "delivery": delivery,
    "flags": flags.toJson(),
    "id": id,
    "safe": safe,
    "lang": lang,
  };
}

class Flags {
  Flags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });

  bool nsfw;
  bool religious;
  bool political;
  bool racist;
  bool sexist;
  bool explicit;

  Flags copyWith({
    bool? nsfw,
    bool? religious,
    bool? political,
    bool? racist,
    bool? sexist,
    bool? explicit,
  }) =>
      Flags(
        nsfw: nsfw ?? this.nsfw,
        religious: religious ?? this.religious,
        political: political ?? this.political,
        racist: racist ?? this.racist,
        sexist: sexist ?? this.sexist,
        explicit: explicit ?? this.explicit,
      );

  factory Flags.fromRawJson(String str) => Flags.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    nsfw: json["nsfw"],
    religious: json["religious"],
    political: json["political"],
    racist: json["racist"],
    sexist: json["sexist"],
    explicit: json["explicit"],
  );

  Map<String, dynamic> toJson() => {
    "nsfw": nsfw,
    "religious": religious,
    "political": political,
    "racist": racist,
    "sexist": sexist,
    "explicit": explicit,
  };
}
