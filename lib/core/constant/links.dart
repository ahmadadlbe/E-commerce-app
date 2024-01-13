class AppLink {
  static String linkserver = "https://storeapp999505.000webhostapp.com";
  // ================  ImageStore ==============
  static String imagestatic = "https://storeapp999505.000webhostapp.com/upload";
  static String catimage = "$imagestatic/categories";
  static String itemsimage = "$imagestatic/items";
  // ================  Test ==============
  static String testlink = "$linkserver/test.php";
  // ================  Auth ==============
  static String signuplink = "$linkserver/auth/signup.php";
  static String verifiycodelink = "$linkserver/auth/verifiycode.php";
  static String resendverifiycodelink =
      "$linkserver/auth/resendverifiycode.php";
  static String loginlink = "$linkserver/auth/login.php";
  // ================  ForgetPassord ==============
  static String checkemaillink =
      "$linkserver/auth/forgetpassword/checkemail.php";
  static String verifiyCodeForgetPasswordlink =
      "$linkserver/auth/forgetpassword/verifiycodeforgetpassword.php";
  static String resetpasswordlink =
      "$linkserver/auth/forgetpassword/resetpassword.php";

  // ================  Home ==============
  static String homelink = "$linkserver/home.php";
  static String itemslink = "$linkserver/items/items.php";
  // ================  favorite ==============

  static String favoriteremove = "$linkserver/favorite/removefavorite.php";
  static String favoriteadd = "$linkserver/favorite/addfavorite.php";
  static String favoriteView = "$linkserver/favorite/view.php";
  static String favoritedeletefrom =
      "$linkserver/favorite/deletfromfavorite.php";

  // ================  Cart ==============
  static String cartadd = "$linkserver/cart/addcart.php";
  static String cartremove = "$linkserver/cart/deletcart.php";
  static String cartview = "$linkserver/cart/view.php";
  static String cartcount = "$linkserver/cart/getitemscount.php";
  // ================  searsh ==============
  static String searsh = "$linkserver/items/searsh.php";
  // ================  Address ==============
  static String addressAdd = "$linkserver/address/add.php";
  static String addressDelete = "$linkserver/address/delete.php";
  static String addressEdite = "$linkserver/address/edite.php";
  static String addressView = "$linkserver/address/view.php";
  // ================  coupon ==============

  static String couponView = "$linkserver/coupon/checkcoupon.php";
  // ================  ordercheck ==============

  static String ordercheck = "$linkserver/orders/checkout.php";
  static String orderpending = "$linkserver/orders/pending.php";
  static String orderarchive = "$linkserver/orders/archive.php";
  static String orderdetails = "$linkserver/orders/details.php";
  static String orderdelete = "$linkserver/orders/delete.php";
  static String orderrating = "$linkserver/orders/rating.php";
  // ================  notification ==============

  static String notification = "$linkserver/notification.php";
  // ================  ordercheck ==============

  static String offers = "$linkserver/offers.php";
}
