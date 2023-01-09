import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelInitial());
  static HomeViewModelCubit get(context) => BlocProvider.of(context);

  RemoteRepository remoteRepository;

}
