enum ToggleButtonsState {
  none,
  emphasis,
  source,
  link;

  ToggleButtonsState alter(ToggleButtonsState update) {
    if (update == this) {
      return none;
    }
    return update;
  }

  int toInt() {
    switch (this) {
      case none:
        return 0;
      case emphasis:
        return 1;
      case source:
        return 2;
      case link:
        return 3;
    }
  }
}

ToggleButtonsState fromInt(int value) {
  switch (value) {
    case 0:
      return ToggleButtonsState.none;
    case 1:
      return ToggleButtonsState.emphasis;
    case 2:
      return ToggleButtonsState.source;
    default:
      return ToggleButtonsState.link;
  }
}
