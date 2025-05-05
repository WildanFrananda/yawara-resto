import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/data/model/booking/booking_request.dart';
import 'package:mobile/data/model/booking/booking_response.dart';
import 'package:mobile/data/model/menu/menu_detail.dart';
import 'package:retrofit/retrofit.dart';

part 'booking_api_client.g.dart';

@RestApi()
abstract interface class BookingApiClient {
  factory BookingApiClient(final Dio https) {
    final baseUrl = dotenv.env['BASE_URL'] ?? '';
    return _BookingApiClient(https, baseUrl: baseUrl);
  }

  @GET('/menus')
  Future<List<MenuDetail>> fetchMenus();

  @POST('/booking')
  Future<BookingResponse> createBooking(@Body() final BookingRequest body);
}
