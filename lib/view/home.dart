import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_startup_accelerator_front_end/viewModel/homeViewModel/home_view_model_cubit.dart';
import '../shared/appColor/app_color.dart';
import '../shared/component/component.dart';

class HomeScreen extends StatelessWidget {

   const HomeScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var homeData = HomeViewModelCubit.get(context);
    return Scaffold(
body: SafeArea(
  top: true,
  child:   ConditionalBuilder(
    condition: state is! HomeDataLoadingState,
    builder:(context)=> BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
    listener: (context, state) {
    },
    builder: (context, state) {
      return SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/logoHouse.svg',height: 25,width: 100,),
                const Spacer(),
                IconButton(onPressed: () {
                  homeData.changAppearance();
                },
                icon: SvgPicture.asset('assets/icons/darkModeIcon.svg',
                    height: 25,width: 25,
                    color: homeData.appearanceBool? Colors.black:Colors.white),
                padding: const EdgeInsets.all(0)),
              ],
            ),
            const SizedBox(height: 20,),
             Text('Find your Ideal Home !',style: Theme.of(context).textTheme.titleLarge,),
             const SliderBanner(),
              const SizedBox(height: 22,),
              SearchField(hintName: 'Search for Address', textInputType: TextInputType.text, prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  const Icon(Icons.search_outlined,color: AppColor.textHintColor,),
                  const SizedBox(width: 10,),
                  Container(height: 20,width: 1,color:AppColor.textHintColor ,)
                ],),
              ), homeData: homeData, controller: homeData.controller,),
              const SizedBox(height: 11,),
               SubmitButton(homeData: homeData,),
              const SizedBox(height: 5,),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=> HouseCard(index: index,),
                  separatorBuilder: (BuildContext context, int index)=> const SizedBox(height: 20,),
                  itemCount: homeData.listTitle!.length,

                ),
              ),
          ],),
        ),
      );
    },
), fallback: (BuildContext context) {
      return const Center(child: CircularProgressIndicator(color: AppColor.mainColor,));
  },
  ),
),
    );
  },
);

  }}




