abstract class BaseRestaurantsRepository{

  Future<List<Category>>getCategories();
  Future<List<Restaurant>>getRestaurants();
  Future<List<User>>getUserProfile();
  Future<List<Meal>>getMeals();

}