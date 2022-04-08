class globalIndex {
  static int serviceIndex = 0;

  void questionAnswered() {
    setState() {
      if (serviceIndex == 3) {
        serviceIndex = 0;
      } else {
        serviceIndex = serviceIndex + 1;
      }
    }
  }
}
