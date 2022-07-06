part of 'home_state.dart';

class HomeModelState {
  bool? isSearching;
  String? search;
  List<Cat>? catList;

  HomeModelState({this.isSearching, this.catList});

  HomeModelState.fromJson(Map<String, dynamic> json) {
    isSearching = json['isSearching'] ?? false;
    search = json['search'] ?? '';
    if (json['catList'] != null) {
      catList = <Cat>[];
      json['catList'].forEach((v) {
        catList!.add(Cat.fromJson(v));
      });
    } else {
      catList = <Cat>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSearching'] = isSearching ?? false;
    data['search'] = search ?? '';
    if (catList != null) {
      data['catList'] = catList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
