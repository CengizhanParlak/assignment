// class Api extends ApiBase{
//   String? _apiKey;
// }

class ApiConstants {
  static const API_URL = "http://test20.internative.net";

  static const ACCOUNT_GET = "$API_URL/Account/Get";
  static const ACCOUNT_UPDATE = "$API_URL/Account/Update";

  static const BLOG_POST = "$API_URL/Blog/GetBlogs";
  static const BLOG_GET = "$API_URL/Blog/GetCategories";
  static const BLOG_POST_FAV = "$API_URL/Blog/ToggleFavorite";

  static const UPLOAD_IMAGE = "$API_URL/General/UploadImage";

  static const SIGN_UP = "$API_URL/Login/SignUp";
  static const LOGIN_URL = "$API_URL/Login/SignIn";
}
