import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/data/model/category/category_model.dart';
import 'package:mobile/data/model/review/review_model.dart';
import 'package:mobile/data/remote/menu/menu_detail_response.dart';
import 'package:mobile/data/remote/menu/paginated_menu.dart';
import 'package:mobile/data/remote/review/pagination_review.dart';
import 'package:retrofit/retrofit.dart';

part 'menu_api_client.g.dart';

@RestApi()
abstract class MenuApiClient {
  factory MenuApiClient(final Dio https) {
    final baseUrl = dotenv.env['BASE_URL'] ?? '';
    return _MenuApiClient(https, baseUrl: baseUrl);
  }

  @GET('/categories')
  Future<List<CategoryModel>> fetchCategories();

  @GET('/menus')
  Future<PaginatedMenu> fetchMenus({
    @Query('page') final int page = 1,
    @Query('limit') final int limit = 10,
  });

  @GET('/menus/{id}')
  Future<MenuDetailResponse> fetchMenuDetail(@Path('id') final String id);

  @GET('/menus/{id}/reviews')
  Future<PaginatedReview> fetchReviews({
    @Path('id') required final String id,
    @Query('page') final int page = 1,
    @Query('limit') final int limit = 10,
  });

  @POST('/review')
  Future<ReviewModel> submitReview(@Body() final Map<String, dynamic> body);

  @GET('/review/{id}')
  Future<List<ReviewModel>> fetchUserReviews(@Path('id') final String id);

  @PUT('/review/{id}')
  Future<ReviewModel> updateReview(
    @Path('id') final String id,
    @Body() final Map<String, dynamic> body,
  );

  @DELETE('/review/{id}')
  Future<void> deleteReview(@Path('id') final String id);
}
