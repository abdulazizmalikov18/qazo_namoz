class MyFunctions {
  static List<String> mont = [
    'Yanvar',
    'Fevral',
    'Mart',
    'Aprel',
    'May',
    'Iyun',
    'Iyul',
    'Avgust',
    'Sentyabr',
    'Oktyabr',
    'Noyabr',
    'Dekabr',
  ];
  static String getmonth(int month) {
    return mont[month - 1];
  }

  bool ischekt({required String password, required String phone}) {
    if (password.length >= 8 && phone.length >= 12) {
      return true;
    } else {
      return false;
    }
  }
}
