import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/fetched/product_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_grid_view.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_row_text_space_between.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_single_popular_product.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_sort_button.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/cutsom_search.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/stringHelper.dart';
import 'package:e_commarce_rest_api/core/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_appvar.dart';

class ShoppingScreen extends StatelessWidget {
  ShoppingScreen({super.key});

  TextEditingController searchCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        child: CustomSortButton(
          onchange: (value) {
            context
                .read<ProductBloc>()
                .add(sortProductEvent(sortoption: value));
          },
        ),
        leding: Icons.arrow_back,
        title: "My Products",
      ),
      body: RefreshIndicator(
        color: Colors.green,
        strokeWidth: DimensionHelper.dimens_30,
        onRefresh: () async {
          context.read<ProductBloc>().add(FetchProductEvent());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DimensionHelper.dimens_12.sp),
            child: Column(
              children: [
                CustomSearchBar(
                  hint: StringHelper.sAProducts,
                  controller: searchCon,
                  onchange: (value) {
                    context
                        .read<ProductBloc>()
                        .add(searchProductEvent(query: value));
                  },
                ),
                SizedBox(
                  height: DimensionHelper.dimens_20.h,
                ),
                CustomRowTextSpaceBetween(
                    title1: StringHelper.aProduct, title2: StringHelper.vAll),
                SizedBox(
                  height: DimensionHelper.dimens_20.h,
                ),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    } else if (state is ProductError) {
                      Utils().toastMessage(state.error.toString());
                    } else if (state is ProductLoaded) {
                      return CustomGridView(
                        itemCount: state.product.length,
                        itemBuilder: (context, index) {
                          final sProduct = state.product[index];
                          return CustomSinglePopularProduct(
                            height: 340,
                            callback: () {},
                            title: sProduct.title.toString(),
                            price: sProduct.price.toString(),
                            image: sProduct.images![0],
                            isWishList: IconButton(
                                onPressed: () {
                                  context.read<ProductBloc>().add(
                                      addWishList(productEntity: sProduct));
                                },
                                icon: Icon(
                                  state.wishlist.contains(sProduct)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: DimensionHelper.dimens_40,
                                  color: state.wishlist.contains(sProduct)
                                      ? Colors.red
                                      : Colors.grey,
                                )),
                          );
                        },
                      );
                    }
                    return Center(
                      child: Text("No Products Found"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
