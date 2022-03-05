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

  @action
  void setAccount(Account account) {
    this.account = account;
  }

  @action
  Future<void> getAccountInfo() async {
    await networkService.getAccountInfo(ApiConstants.TEST_TOKEN)?.then((account) {
      setAccount(account);
    });
  }

  @action
  void setFavorites() {}

  @action
  void changeAccountImage(String url) {
    /// TODO:
    /// /General/UploadImage/ image POST ile atılacak. dönen datadan url alınacak
    /// /Account/Update/ image URL update edilecek
    account!.image = url;
  }

  @action
  void updateAccountInfo() {
    networkService.updateAccountInfo(ApiConstants.TEST_TOKEN, account: account ?? Account());
  }
}
