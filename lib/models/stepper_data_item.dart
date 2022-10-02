class StepperDataItem {
  final String title;
  final String? subtitle;
  final String description;

  bool isActive = false;
  bool isDone = false;

  StepperDataItem(
      {required this.title, this.subtitle, required this.description});
}
