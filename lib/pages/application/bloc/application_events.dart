abstract class ApplicationEvents {
  const ApplicationEvents();
}

class TriggerApplicationEvent extends ApplicationEvents {
  final int index;
  const TriggerApplicationEvent(this.index) : super();
}
