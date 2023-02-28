// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:section2/domain/model/model.dart';
import 'package:section2/presentation/base/baseviewmodel.dart';
import 'package:section2/presentation/resources/assets_manager.dart';
import 'package:section2/presentation/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutpus {
  // stream controller
  final StreamController _streamCoontroller =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamCoontroller.close();
  }

  @override
  void start() {
    print("tart");
    _list = _getSliderDate();
    // send this slider to our view
    _postDateToView();
  }

  @override
  int goNext() {
    _currentIndex++;
    int nextIndex = _currentIndex; // +1
    if (nextIndex >= _list.length) {
      _currentIndex = 0; // infinite loop go to first item of slider list
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    _currentIndex--;
    int previousIndex = _currentIndex; // -1
    if (previousIndex == -1) {
      _currentIndex =
          _list.length - 1; // infinite loop go to the length of slider list
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDateToView();
  }

  // input
  @override
  Sink get inputSliderViewObject => _streamCoontroller.sink;

  // outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamCoontroller.stream.map((sliderViewObject) => sliderViewObject);

  // private functions
  List<SliderObject> _getSliderDate() => [
        SliderObject(AppString.onBoardingTitle1, AppString.onBoardingSUBTitle1,
            ImageAssets.onBoardingLogo1),
        SliderObject(AppString.onBoardingTitle2, AppString.onBoardingSUBTitle2,
            ImageAssets.onBoardingLogo2),
        SliderObject(AppString.onBoardingTitle3, AppString.onBoardingSUBTitle3,
            ImageAssets.onBoardingLogo3),
        SliderObject(AppString.onBoardingTitle4, AppString.onBoardingSUBTitle4,
            ImageAssets.onBoardingLogo4)
      ];

  _postDateToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// inputs mean the orders that our view model will receive from our view
abstract class OnboardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe left
  void goPrevious(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);

  Sink
      get inputSliderViewObject; // this is the way to add data to the stream .. stream input
}

// outputs mean data or results that will be sent from our view model to our view
abstract class OnboardingViewModelOutpus {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSliders;
  int currentindex;
  SliderViewObject(this.sliderObject, this.numOfSliders, this.currentindex);
}
