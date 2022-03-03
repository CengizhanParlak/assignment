import 'package:assignment/view/home/profile/model/account.dart';
import 'package:mobx/mobx.dart';

part 'account_view_model.g.dart';

class AccountViewModel = _AccountViewModelBase with _$AccountViewModel;

// TODO: BaseViewModel ekle https://github.com/VB10/flutter-architecture-template/blob/master/lib/view/home/build/feed/viewmodel/build_feed_view_model.dart
abstract class _AccountViewModelBase with Store {
  @observable
  Account? account;

  @action
  void setAccount(Account account) {
    this.account = account;
  }

  @action
  void changeAccountImage(String url) {
    /// TODO:
    /// /General/UploadImage/ image POST ile atılacak. dönen datadan url alınacak
    /// /Account/Update/ image URL update edilecek
    account!.image = url;
  }
}
