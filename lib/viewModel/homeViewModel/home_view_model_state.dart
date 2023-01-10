part of 'home_view_model_cubit.dart';

abstract class HomeViewModelState {}

class HomeViewModelInitial extends HomeViewModelState {}
class NavCarouseIndexState extends HomeViewModelInitial {}
class ChangeAppearanceState extends HomeViewModelInitial {}
class HomeDataSuccessState extends HomeViewModelInitial {}
class HomeDataLoadingState extends HomeViewModelInitial {}
class ListTitleState extends HomeViewModelInitial {}