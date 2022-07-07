part of 'home_state.dart';

class HomeModelState {
  bool? isSearching;
  String? search;
  List<Cat>? catList;
  List<Cat>? searchCatList;

  HomeModelState({
    this.search,
    this.isSearching,
    this.catList,
    this.searchCatList,
  });

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
    if (json['searchCatList'] != null) {
      searchCatList = <Cat>[];
      json['searchCatList'].forEach((v) {
        searchCatList!.add(Cat.fromJson(v));
      });
    } else {
      searchCatList = <Cat>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSearching'] = isSearching ?? false;
    data['search'] = search ?? '';
    if (catList != null) {
      data['catList'] = catList!.map((v) => v.toJson()).toList();
    }
    if (searchCatList != null) {
      data['searchCatList'] = searchCatList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
