import 'package:logisticsmobile/data/core/api_constants.dart';

import '../core/api_client.dart';
import '../models/request_token_model.dart';

abstract class AuthRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String?> createSession(Map<String, dynamic> requestBody);
  Future<bool> deleteSession(String sessionId);
}

class AuthRemoteDataSourceImpl
    extends AuthRemoteDataSource {
  final ApiClient _client;
 


  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final response = await _client.get('${ApiConstants.BASE_URL}authentication/token/new');
   // print(response);
    final requestTokenModel = RequestTokenModel.fromJson(response);
    return requestTokenModel;
  }

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      '${ApiConstants.BASE_URL}authentication/token/validate_with_login',
      params: requestBody,
    );
   // print(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<String?> createSession(Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      '${ApiConstants.BASE_URL}authentication/session/new',
      params: requestBody,
    );
   // print(response);
    return response['success'] ? response['session_id'] : null;
  }

  @override
  Future<bool> deleteSession(String sessionId) async {
    final response = await _client.deleteWithBody(
      '${ApiConstants.BASE_URL}authentication/session',
      params: {
        'session_id': sessionId,
      },
    );
    return response['success'] ?? false;
  }
}
