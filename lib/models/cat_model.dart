class Cat {
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? description;
  String? lifeSpan;
  int? adaptability;
  int? childFriendly;
  int? healthIssues;
  int? intelligence;
  String? wikipediaUrl;
  ImageCat? imageCat;

  Cat({
    this.id,
    this.name,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpan,
    this.adaptability,
    this.childFriendly,
    this.healthIssues,
    this.intelligence,
    this.wikipediaUrl,
    this.imageCat,
  });

  Cat.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    temperament = json['temperament'] ?? '';
    origin = json['origin'] ?? '';
    description = json['description'] ?? '';
    lifeSpan = json['life_span'] ?? '';
    adaptability = json['adaptability'] ?? 0;
    childFriendly = json['child_friendly'] ?? 0;
    healthIssues = json['health_issues'] ?? 0;
    intelligence = json['intelligence'] ?? 0;
    wikipediaUrl = json['wikipedia_url'] ?? '';
    imageCat = json['image'] != null ? ImageCat.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['temperament'] = temperament;
    data['origin'] = origin;
    data['description'] = description;
    data['life_span'] = lifeSpan;
    data['adaptability'] = adaptability;
    data['child_friendly'] = childFriendly;
    data['health_issues'] = healthIssues;
    data['intelligence'] = intelligence;
    data['wikipedia_url'] = wikipediaUrl;
    if (imageCat != null) {
      data['image'] = imageCat!.toJson();
    }

    return data;
  }
}

class ImageCat {
  String? id;
  String? url;

  ImageCat({
    this.id,
    this.url,
  });

  ImageCat.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    url = json['url'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['url'] = url;

    return data;
  }
}
