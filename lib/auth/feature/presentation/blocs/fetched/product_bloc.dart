import 'package:bloc/bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/entity/category_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/entity/product_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/category_usecase.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/usecase/product_use_case.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_sort_button.dart';
import 'package:e_commarce_rest_api/core/utils/connectivity_service.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
   List<ProductEntity>allProduct = [];
   List<ProductEntity>sortedProduct =[];
   List<ProductEntity>wishlisted = [];
  final CategoryUseCase categoryUseCase;
  final ProductUseCase productUseCase;
  final ConnectivityService connectivityService;
  ProductBloc({required this.categoryUseCase, required this.connectivityService,required this.productUseCase}) : super(ProductInitial()) {
                                                               // ALL CATEGORYS HERE
    on<FetchCategoryEvent>((event, emit) async {
      emit(ProductLoading());
      bool connection = await connectivityService.isConnected();
      if(!connection){
        emit(ProductError(error: "No InterNet Connection"));
        return;
      }
      final category = await categoryUseCase();
      category.fold(
        (l) => emit(ProductError(error: l.toString())),
        (category) => emit(CategoryLoaded(category: category)),
      );
    });
                                                               // all products here
    on<FetchProductEvent>((event, emit) async {
      emit(ProductLoading());
      bool connection = await connectivityService.isConnected();
      if(!connection){
        emit(ProductError(error: "No InterNet Connection"));
        return;
      }
      final product = await productUseCase();
      product.fold(
            (l) => emit(ProductError(error: l.toString())),
            (product) {
              allProduct.clear();
              allProduct.addAll(product);
              emit(ProductLoaded(product: product,wishlist: wishlisted));},
      );
    });
    on<searchProductEvent>((event, emit) async {
      emit(ProductLoading());

      // Check Internet Connection
      bool connection = await connectivityService.isConnected();
      if (!connection) {
        emit(ProductError(error: "No Internet Connection"));
        return;
      }

      // If query is empty, show all products
      if (event.query.isEmpty) {
        if (allProduct.isEmpty) {
          // Fetch products from API if not already loaded
          final result = await productUseCase();
          result.fold(
                (failure) => emit(ProductError(error: "Failed to fetch products")),
                (products) {
              allProduct = products;
              emit(ProductLoaded(product: products,wishlist: wishlisted));
            },
          );
        } else {
          emit(ProductLoaded(product: allProduct,wishlist: wishlisted));
        }
        return;
      }

      // Search from local list
      final searchProduct = allProduct
          .where((element) =>
          element.title!.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      emit(ProductLoaded(product: searchProduct,wishlist: wishlisted));
    });
    // sort function here
    on<sortProductEvent>((event, emit) async {
      emit(ProductLoading());

      // Apply sorting on products
      sortedProduct = List.from(allProduct);

      if (event.sortoption == Sortoption.LOW_TO_HIGH) {
        sortedProduct.sort((a, b) => (a.price??0).compareTo(b.price??0));
      } else if (event.sortoption == Sortoption.HIGH_TO_LOW) {
        sortedProduct.sort((a, b) => (b.price??0).compareTo(a.price??0));
      }
      else if(event.sortoption == Sortoption.GENERAL){
        sortedProduct = allProduct;
      }

      // If search query was provided, filter the sorted products


      emit(ProductLoaded(product: sortedProduct,wishlist: wishlisted));
    });
    // add wishlist product
    on<addWishList>((event, emit) {
      if(!wishlisted.contains(event.productEntity)){
        wishlisted.add(event.productEntity);
      }
      emit(ProductLoaded(product: allProduct, wishlist: wishlisted));
    },);
    // remove wishlist products
    on<removeWishlist>((event, emit) {
      wishlisted.remove(event.productEntity);
      emit(ProductLoaded(product: allProduct, wishlist:wishlisted));
    },);

  }
}
