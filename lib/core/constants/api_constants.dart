class ApiConstants {
  static const API_URL = "http://test20.internative.net";

  static const GET_ACCOUNT = "$API_URL/Account/Get";
  static const UPDATE_ACCOUNT = "$API_URL/Account/Update";

  static const GET_POSTS = "$API_URL/Blog/GetBlogs";
  static const GET_CATEGORIES = "$API_URL/Blog/GetCategories";
  static const FAV_BLOG_POST = "$API_URL/Blog/ToggleFavorite";

  static const UPLOAD_IMAGE = "$API_URL/General/UploadImage";

  static const SIGN_UP = "$API_URL/Login/SignUp";
  static const SIGN_IN = "$API_URL/Login/SignIn";

  static String TEST_TOKEN =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjFmOTlkOGIwN2QxZTEzOWFmNWI0Y2YiLCJuYmYiOjE2NDYyMzgxNjgsImV4cCI6MTY0ODgzMDE2OCwiaXNzIjoiaSIsImF1ZCI6ImEifQ.lpmO04HwFmExg9JCVMsKznbhMCq6sidIiOS5WvDRft8";
}
