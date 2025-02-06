import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/fetched/product_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_appvar.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_category.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_row_text_space_between.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_single_popular_product.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/cutsom_list_seprator.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/cutsom_search.dart';
import 'package:e_commarce_rest_api/core/constant/assetsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/stringHelper.dart';
import 'package:e_commarce_rest_api/core/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final searchCon = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        leding: Icons.arrow_back_ios,
        hometitle: true,
        subtitle: StringHelper.name,
        title: StringHelper.sStore,
        trailing: Icons.shopping_bag_outlined,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionHelper.dimens_16.sp),
          child: Column(
            children: [
              CustomSearchBar(
                controller: searchCon,
                hint: StringHelper.doShop,
              ),
              SizedBox(
                height: DimensionHelper.dimens_20,
              ),
              BlocBuilder<ProductBloc, ProductState>(
                buildWhen: (previous, current) => current is CategoryLoaded,
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else if (state is ProductError) {
                    Utils().toastMessage(state.error.toString());
                  }
                  else if (state is CategoryLoaded) {
                    return CustomListSeprator(
                      height: 180,
                      count: state.category.length,
                      itembuilder: (context, index) {
                        final category = state.category[index];
                        return CustomCategory(
                            callback: () {
        
                            },
                            title: category.name.toString(),
                            image: category.image.toString()
                        );
                      },);
                  }
                  return SizedBox();
                },
              ),
              Container(
                width: DimensionHelper.dimens_all.w,
                height: DimensionHelper.dimens_250.h,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AssetsHelper.slid2)),
                    borderRadius: BorderRadius.circular(
                        DimensionHelper.dimens_20.r)
                ),
              ),
              CustomRowTextSpaceBetween(
                  callback: () {
        
                  },
                  title1: StringHelper.PProduct, title2: StringHelper.vAll),
              BlocBuilder<ProductBloc, ProductState>(
                buildWhen: (previous, current) => current is ProductLoaded,
                builder: (context, state) {
                  if(state is ProductLoading){
                    Center(child: CircularProgressIndicator(color: Colors.green,),);
                  }
                  else if(state is ProductError){
                    Utils().toastMessage(state.error);
                  }
                  else if(state is ProductLoaded){
                    return CustomListSeprator(
                      height: 330,
                      count: state.product.length,
                      itembuilder: (context, index) {
                        final product = state.product[index];
                      return CustomSinglePopularProduct(
                        callback: () {
                          context.go("/details",extra: product);
                        },
                        height: 240,
                        width: DimensionHelper.dimens_200,
                        title: product.title,
                        image: product.images![0],
                        price: product.price.toString(),
        
                      );
                    },);
                  }
                  return SizedBox();
                },
              ),
              SizedBox(height: DimensionHelper.dimens_20.h,),
              CustomRowTextSpaceBetween(
                  title1: StringHelper.nArrival, title2: StringHelper.vAll),
              Container(
                width: DimensionHelper.dimens_all.w,
                height: DimensionHelper.dimens_250.h,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AssetsHelper.slid1)),
                    borderRadius: BorderRadius.circular(
                        DimensionHelper.dimens_20.r)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
