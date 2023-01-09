import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_startup_accelerator_front_end/viewModel/homeViewModel/home_view_model_cubit.dart';

import '../shared/appColor/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewModelCubit(),
       child: BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
         listener: (context, state) {
  },
    builder: (context, state) {return Scaffold(
body: SafeArea(
  top: true,
  child:   SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/logoHouse.svg',height: 25,width: 100,),
            const Spacer(),
            IconButton(onPressed: () {},
            icon: SvgPicture.asset('assets/icons/darkModeIcon.svg',height: 25,width: 25,),
            padding: const EdgeInsets.all(0)),
          ],
        ),
        const SizedBox(height: 20,),
         Text('Find your Ideal Home !',style: Theme.of(context).textTheme.titleLarge,),
        const SliderBanner(),
          const SizedBox(height: 22,),
          CustomTextField(hintName: 'Search for Address', textInputType: TextInputType.text, prefix: Padding(
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
          ),),
          const SizedBox(height: 11,),
          const SubmitButton(),
          const SizedBox(height: 5,),
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)=>const HouseCard(),
              separatorBuilder: (BuildContext context, int index)=> const SizedBox(height: 20,),
              itemCount: 6,

            ),
          ),
      ],),
    ),
  ),
),
    );
  },
),
);
  }
}

class SliderBanner extends StatelessWidget {
  const SliderBanner({super.key,});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return SvgPicture.asset('assets/icons/logoHouse.svg');
      },
      options: CarouselOptions(
        viewportFraction: 1,
        enableInfiniteScroll: false,
      ),
      itemCount: 2,
    );
  }
}

class CustomTextField extends StatelessWidget{
  final TextInputType textInputType;
  final String hintName;
  final Widget prefix;
  const CustomTextField({super.key, required this.hintName, required this.prefix, required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: hintName,
        hintStyle: const TextStyle(color: AppColor.textHintColor,
            fontFamily: 'Poppins',fontWeight: FontWeight.normal,fontSize: 18),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 15 ),
        filled: true,
        fillColor: AppColor.textFieldColor,
        prefixIcon: prefix,
        enabledBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(width: 1, color: Color(0xFFFFFFFF)),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(width: 1.5, color: Color(0xFFFFFFFF)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

}

class SubmitButton extends StatelessWidget{
  const SubmitButton({super.key});

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
      onPressed: () {},
      child: const Text('Search',style: TextStyle(color: Colors.white,
          fontSize: 18,fontWeight: FontWeight.w500, fontFamily: 'Poppins'),),
    );
  }
}

class HouseCard extends StatelessWidget{
  const HouseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 110,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
        child: Column(
          children: [
            Row(children: [
              Text('Calabasas, CA',style: Theme.of(context).textTheme.titleLarge,),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.textHintColor,size: 20,),
            ],),
              const SizedBox(height: 5,),
              Row(children:  [
                  SvgPicture.asset('assets/icons/FilterIcon.svg',height: 12,width: 12,),
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
  }
}