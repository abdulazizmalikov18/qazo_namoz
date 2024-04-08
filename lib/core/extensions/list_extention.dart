extension ListExt on List {
  int? findIndex<T>(bool Function(T value) find) {
    for(int i = 0; i< length; i++) {
      if(find(this[i])) {
        return i;
      }
    }
    return null;
  }
}