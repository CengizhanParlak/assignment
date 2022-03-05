import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/model/category_model.dart';
import 'package:assignment/view/home/home_screen/service/blog_network_service.dart';
import 'package:mobx/mobx.dart';
part 'category_view_model.g.dart';

class CategoryViewModel = _CategoryViewModelBase with _$CategoryViewModel;

abstract class _CategoryViewModelBase with Store {
  final BlogNetworkService networkService = BlogNetworkService();

  @observable
  List<Category>? categories;

  @observable
  int selectedCategoryIndex = -1;

  @observable
  bool isLoading = false;

  @computed
  bool get isCategoriesEmpty => categories?.isEmpty ?? true;

  @action
  void fetchCategories() {
    isLoading = true;
    networkService.getCategoriesGET(ApiConstants.TEST_TOKEN)?.then((value) {
      if (value.isNotEmpty) {
        categories?.clear();
        categories = value;
      }
    });
    isLoading = false;
  }
}
