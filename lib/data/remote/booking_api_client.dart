import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/data/model/booking/booking_request.dart';
import 'package:mobile/data/model/booking/booking_response.dart';
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/data/model/reservation/reservation_request.dart';
import 'package:mobile/data/model/reservation/reservation_response.dart';
import 'package:mobile/data/model/table/table_model.dart';
import 'package:retrofit/retrofit.dart';

part 'booking_api_client.g.dart';

@RestApi()
abstract interface class BookingApiClient {
  factory BookingApiClient(final Dio https) {
    final baseUrl = dotenv.env['BASE_URL'] ?? '';
    return _BookingApiClient(https, baseUrl: baseUrl);
  }

  @GET('/menus')
  Future<List<MenuModel>> fetchMenus();

  @POST('/booking')
  Future<BookingResponse> createBooking(@Body() final BookingRequest body);

  @GET('/tables')
  Future<List<TableModel>> fetchTables();

  @POST('/booking')
  Future<ReservationResponse> createReservation(@Body() final ReservationRequest body);
}
