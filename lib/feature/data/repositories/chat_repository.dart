import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:open_ai_app/core/endpoint/network.dart';
import 'package:open_ai_app/core/error/network_failure.dart';
import 'package:open_ai_app/feature/domain/model/chat_response.dart';

class ChatRepository {
  final ApiEndpoint apiEndpoint;
  final Dio dioClient;

  ChatRepository({required this.apiEndpoint, required this.dioClient});

  Future<Either<NetworkFailure, ResponseData>> generateResponse(
      String prompt) async {
    Either<NetworkFailure, ResponseData> successORFailure;
    try {
      final response = await apiEndpoint.callApi(dioClient);
      ResponseData newresponse = ResponseData.fromJson(response);
      successORFailure = right(newresponse);
    } on NetworkFailure catch (e) {
      successORFailure = left(e);
    }
    return successORFailure;
  }
}
