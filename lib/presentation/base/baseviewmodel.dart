abstract class BaseViewModel extends BaseviewModelInputs with BaseviewModelOutputs {
  // shared variables and functions that will be used through any view model.
}

abstract class BaseviewModelInputs {
  void start(); // will be called while init. of view model
  void dispose(); // will be called when view model dies
}

abstract class BaseviewModelOutputs {}
