part of 'home_state.dart';

class _HomeState extends StateNotifier<HomeModelState> {
  _HomeState(this.ref) : super(HomeModelState.fromJson({}));

  final Ref ref;

  Future<void> getAllCats() async {
    try {
      final response = await catService.getCats();
      state.catList = response;
      state = HomeModelState.fromJson(state.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
