class MyFunctions {
  List<String> mont = [
    'Yanvar',
    'Fevral',
    'dfd',
    'dfa',
    'fdf',
    'dfd',
    'dfa',
    'fdf',
    'dfd',
    'dfa',
    'fdf',
    'dfd',
    'dfa',
    'fdf'
  ];
  getmonth(int month) {
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
