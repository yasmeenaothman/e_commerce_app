import 'package:e_commerce_app/modles/category_model.dart';
import 'package:get/get.dart';

import '../../../../api/repo/categories_repo.dart';

class CategoryScreenController extends GetxController{
  CategoryModel? selectedCategory;
  List categoryProducts = [];
  dynamic categories =[];
  bool isLoading = false;
  setIsLoading(bool isLoading){
    this.isLoading = isLoading;
    update();
  }
  updateSelectedCategory(CategoryModel selectedCategory){
    this.selectedCategory = selectedCategory;
    update();
  }
  getAllProductsByCategoryRequest() async{
    setIsLoading(true);
    categoryProducts = await CategoriesRepo.getAllProductsByCategoryRequest(selectedCategory!.id);
    update();
    setIsLoading(false);
  }
  getSingleCategoryRequest(int categoryId) async{
    return await CategoriesRepo.getSingleCategoryRequest(categoryId);
  }
  getCategories() async {
    setIsLoading(true);
    categories = await CategoriesRepo.getAllCategoriesRequest();
    update();
    setIsLoading(false);
  }
  updateCategoriesList(List<CategoryModel> categories){
    this.categories = categories;
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}