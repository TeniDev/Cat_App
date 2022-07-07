part of 'home_state.dart';

class _HomeState extends StateNotifier<HomeModelState> {
  _HomeState(this.ref) : super(HomeModelState.fromJson({}));

  final Ref ref;

  final TextEditingController searchController = TextEditingController();

  Future<void> getAllCats() async {
    try {
      final response = await catService.getCats();
      state.catList = response;
      state = HomeModelState.fromJson(state.toJson());
    } catch (e) {
      rethrow;
    }
  }

  void goToCatDetail(BuildContext context, Cat catInfo) {
    context.push('/detail/${catInfo.id}', extra: catInfo);
  }

  void isSearching(String valueSearch) {
    state.search = valueSearch;
    if (valueSearch.isNotEmpty) {
      state.isSearching = true;
      state = HomeModelState.fromJson(state.toJson());
    } else {
      state.isSearching = false;
      state = HomeModelState.fromJson(state.toJson());
    }
  }

  bool matchSearch(String catName) {
    if (catName.toLowerCase().contains(state.search!.toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }
}
