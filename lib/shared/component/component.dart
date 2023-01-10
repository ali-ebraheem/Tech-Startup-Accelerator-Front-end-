import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../viewModel/homeViewModel/home_view_model_cubit.dart';
import '../appColor/app_color.dart';
import '../sharedPreferences/shared_preferences.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({super.key,});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            var homeData = HomeViewModelCubit.get(context);
            return Image.network(homeData.homeModel!.images![index]);
          },
        );
      },
      options: CarouselOptions(
        viewportFraction: 1,
        enableInfiniteScroll: false,
      ),
      itemCount: 2,
    );
  }
}



class SearchField extends StatelessWidget{
  final HomeViewModelCubit homeData;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintName;
  final Widget prefix;
  const SearchField({super.key,
    required this.hintName,
    required this.prefix,
    required this.textInputType,
    required this.homeData, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value){
        homeData.changeController(controller);
      },
      keyboardType: textInputType,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: hintName,
        hintStyle: const TextStyle(color: AppColor.textHintColor,
            fontFamily: 'Poppins',fontWeight: FontWeight.normal,fontSize: 18),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 15 ),
        filled: true,
        fillColor: SharedPreference.getData(key: 'Appearance')?
        Colors.white:AppColor.scaffoldBackgroundColor,
        prefixIcon: prefix,
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 1,
            color: SharedPreference.getData(key: 'Appearance')?
            Colors.white:AppColor.scaffoldBackgroundColor,),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 1.5,
            color: SharedPreference.getData(key: 'Appearance')?
            Colors.white:AppColor.scaffoldBackgroundColor,),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

}



class SubmitButton extends StatelessWidget{
  final HomeViewModelCubit homeData;
  const SubmitButton({super.key,required this.homeData});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.mainColor),
        borderRadius: BorderRadius.circular(2),
      ),
      minWidth: double.infinity,
      height: 48,
      color: AppColor.mainColor,
      onPressed: () {
        homeData.search(homeData.controller.text);
      },
      child: const Text('Search',
        style: TextStyle(color: Colors.white,
            fontSize: 18,fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),),
    );
  }
}



class HouseCard extends StatelessWidget{
  final int index;
  const HouseCard({super.key, required this.index,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var homeData = HomeViewModelCubit.get(context);
        return Container(
          color: homeData.appearanceBool?
          Colors.white:AppColor.scaffoldBackgroundColor,
          height: 110,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
            child: Column(
              children: [
                Row(children: [
                  Text('${homeData.listTitle![index]}, CA',
                    style: Theme.of(context).textTheme.titleLarge,),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.textHintColor,size: 20,),
                ],),
                const SizedBox(height: 5,),
                Row(children:  [
                  SvgPicture.asset('assets/icons/FilterIcon.svg',
                    height: 12,width: 12,),
                  const SizedBox(width: 20,),
                  const Text('\$1.5k+/2 Beds/Appt. ... 3 more',
                      style:TextStyle(fontWeight: FontWeight.normal,
                          fontSize: 16,fontFamily: 'Poppins',
                          color: AppColor.cardBodyText)),
                ],),

              ],
            ),
          ),
        );
      },
    );
  }
}