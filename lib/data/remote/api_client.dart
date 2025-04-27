import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/data/model/login/login_request.dart';
import 'package:mobile/data/model/login/login_response.dart';
import 'package:mobile/data/model/register/register_request.dart';
import 'package:mobile/data/model/register/register_response.dart';
import 'package:mobile/data/model/user/user.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract interface class ApiClient {
  factory ApiClient(final Dio https) {
    final baseUrl = dotenv.env['BASE_URL'] ?? '';
    return _ApiClient(https, baseUrl: baseUrl);
  }

  /// auth endpoints
  @POST('/auth/register')
  Future<HttpResponse<RegisterResponse>> register(@Body() final RegisterRequest request);

  @POST('auth/login')
  Future<HttpResponse<LoginResponse>> login(@Body() final LoginRequest request);

  @POST('auth/refresh')
  Future<HttpResponse<LoginResponse>> refresh(@Body() final Map<String, String> request);

  @GET('/user/profile')
  Future<User> getProfile();

  @PUT('/user/profile')
  @MultiPart()
  Future<HttpResponse<User>> updateProfile(
    @Part(name: 'name') final String name,
    @Part(name: 'email') final String email,
    @Part(name: 'phone') final String? phone,
    @Part(name: 'address') final String? address,
    @Part(name: 'avatar') final File? avatar,
  );
}
