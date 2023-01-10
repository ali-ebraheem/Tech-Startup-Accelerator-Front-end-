import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_startup_accelerator_front_end/repository/repository.dart';
import '../../model/home_model.dart';
import '../../shared/sharedPreferences/shared_preferences.dart';
part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelInitial());
  static HomeViewModelCubit get(context) => BlocProvider.of(context);

var remoteRepository= const RemoteRepository().getHttp();
var appearanceBool=SharedPreference.getData(key: 'Appearance');
late List<String>? listTitle;
HomeModel? homeModel;
bool changAppearanceBool=true;
TextEditingController controller=TextEditingController();



void changAppearance(){
  changAppearanceBool=!changAppearanceBool;
  SharedPreference.putData(key: 'Appearance', value: changAppearanceBool);
  appearanceBool=SharedPreference.getData(key: 'Appearance');
  emit(ChangeAppearanceState());
}



void homeData() {
  emit(HomeDataLoadingState());
  const RemoteRepository().getHttp().then((value) {
    print(value);
    homeModel = HomeModel.fromJson(value.data);
    listTitle = homeModel!.house!.houseName;
    emit(HomeDataSuccessState());
  }).catchError((error) {

  });
}

void changeController(value){
  controller=value;
  emit(ListTitleState());
}


void search(String query){
  final suggestion=homeModel!.house!.houseName!.where((element) {
    final nameTitle=element.toLowerCase();
    final input=query.toLowerCase();
    return nameTitle.contains(input);

  }).toList();
  listTitle=suggestion;
  emit(ListTitleState());
}
}
