import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/profile/model/account.dart';
import 'package:assignment/view/home/profile/service/account_network_service.dart';
import 'package:mobx/mobx.dart';

part 'account_view_model.g.dart';

class AccountViewModel = _AccountViewModelBase with _$AccountViewModel;

// TODO: BaseViewModel ekle https://github.com/VB10/flutter-architecture-template/blob/master/lib/view/home/build/feed/viewmodel/build_feed_view_model.dart
abstract class _AccountViewModelBase with Store {
  final AccountNetworkService networkService = AccountNetworkService();

  @observable
  Account? account;

  @computed
  List<String> get getFavoriteBlogIds => account?.favoriteBlogIds ?? [];

  @computed
  bool get isAccountImageEmpty => account?.image?.isEmpty ?? true;

  @computed
  String get getAccountImage => account?.image ?? "";

  @action
  void setAccount(Account account) {
    this.account = account;
  }

  @action
  Future<void> getAccountInfo(context) async {
    await networkService.getAccountInfo(context, ApiConstants.TEST_TOKEN)?.then((account) {
      setAccount(account);
    });
  }

  @action
  void setFavorites() {}

  @action
  setLocation(String long, String lat) {
    account?.location = Location.fromJson(
      {
        'Longtitude': long,
        'Latitude': lat,
      },
    );
  }

  @action
  Future<void> uploadAccountImage(context, String imagePath) async {
    String resultedImageUrl = await networkService.uploadAccountImage(context, ApiConstants.TEST_TOKEN,
        account: account!, imagePath: imagePath);
    account?.image = resultedImageUrl;
  }

  @action
  void changeAccountImage(String url) {
    account?.image = url;
  }

  @action
  void updateAccountInfo(context) {
    networkService.updateAccountInfo(context, ApiConstants.TEST_TOKEN, account: account ?? Account());
  }
}
