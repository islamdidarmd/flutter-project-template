class Result {
  Result({this.showSnackBar, this.showPopup, this.info});

  final bool? showSnackBar;
  final bool? showPopup;
  final Info? info;
}

class Success<T> extends Result {
  Success({
    this.data,
    showSnackBar,
    showPopup,
    info,
  }) : super(
    showSnackBar: showSnackBar,
    showPopup: showPopup,
    info: info,
  );

  final T? data;
}

class Loading extends Result {
  Loading({Info? info}) : super(info: info);
}

class Error extends Result {
  Error({
    showSnackBar,
    showPopup,
    info,
  }) : super(
    showSnackBar: showSnackBar,
    showPopup: showPopup,
    info: info,
  );
}

class Info {
  Info({this.title, this.message});

  final String? title;
  final String? message;
}
