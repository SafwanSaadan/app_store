import '../../../core/constant/AppColor.dart';
import '../../model/home.dart';
import '../../model/onboardingmodel.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/ConstText.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      body: ConstText.onBoardingBody1,
      image: ImageAsset.onBoardingImage1,
      color: AppColor.green2),
  OnBoardingModel(
      body: ConstText.onBoardingBody1,
      image: ImageAsset.onBoardingImage2,
      color: AppColor.blue),
  OnBoardingModel(
      body: ConstText.onBoardingBody1,
      image: ImageAsset.onBoardingImage3,
      color: AppColor.blue1),
];

List<OnBoardingModel> onBoardingList1 = [
  OnBoardingModel(
      body: ConstText.onBoardingBody2,
      image: ImageAsset.onBoardingImage4,
      color: AppColor.grey),
  OnBoardingModel(
      body: ConstText.onBoardingBody2,
      image: ImageAsset.onBoardingImage5,
      color: AppColor.blue2),
  OnBoardingModel(
      body: ConstText.onBoardingBody2,
      image: ImageAsset.onBoardingImage6,
      color: AppColor.red1),
];

List<HomeModel> homeModel = [
  HomeModel(
      title: ConstText.homeModelTitle1,
      body: ConstText.homeModelBody1,
      image: ImageAsset.homeModelImage1),
  HomeModel(
      title: ConstText.homeModelTitle2,
      body: ConstText.homeModelBody2,
      image: ImageAsset.homeModelImage2),
];
