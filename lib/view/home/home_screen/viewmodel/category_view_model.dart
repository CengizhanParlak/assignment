import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/model/category_model.dart';
import 'package:assignment/view/home/home_screen/service/home_screen_network_service.dart';
import 'package:mobx/mobx.dart';
part 'category_view_model.g.dart';

class CategoryViewModel = _CategoryViewModelBase with _$CategoryViewModel;

late final networkService = HomeScreenNetworkService();

abstract class _CategoryViewModelBase with Store {
  @observable
  List<Category>? categories;

  @computed
  bool get isCategoriesLoaded => categories != null;

  @computed
  bool get isCategoriesEmpty => categories?.isEmpty ?? true;

  @action
  void fetchCategories() {
    networkService.getCategoriesGET(ApiConstants.TEST_TOKEN)?.then((value) {
      if (value.isNotEmpty) {
        categories = value;
      }
    });
  }
}
