import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_appvar.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/utility.dart';
import '../../blocs/fetched/product_bloc.dart';
import '../../widgets/custom_grid_view.dart';
import '../../widgets/custom_single_popular_product.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leding: Icons.arrow_back,
        title: "WishList Products",
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(DimensionHelper.dimens_15.h),child: Column(
          children: [
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
                    itemCount: state.wishlist.length,
                    itemBuilder: (context, index) {
                      final sProduct = state.wishlist[index];
                      return CustomSinglePopularProduct(
                        height: 340,
                        callback: () {},
                        title: sProduct.title.toString(),
                        price: sProduct.price.toString(),
                        image: sProduct.images![0],
                        isWishList: IconButton(
                            onPressed: () {
                              context.read<ProductBloc>().add(
                                  removeWishlist(productEntity: sProduct));
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
        ),),
      ),
    );
  }
}
