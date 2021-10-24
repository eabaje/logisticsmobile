import 'package:logisticsmobile/data/core/api_constants.dart';
import 'package:logisticsmobile/data/models/subscribe.dart';
import 'package:logisticsmobile/data/models/user.dart';
import 'package:logisticsmobile/data/models/vehicle.dart';
import '../core/api_client.dart';


abstract class UserRemoteDataSource {
 Future<List<User>> getUsers();
  
  Future<User> getUserById(String id);
 
  Future<List<User>> getSearchedUsers(String searchTerm);

 

  Future<String> saveUser(Map<String, dynamic> requestBody);

  Future<String> editUser(Map<String, dynamic> requestBody);

   
 Future<List<UserSubscription>> findAllUserSubscriptionsByDate(String startDate, String endDate);
  
  Future<UserSubscription> findUserSubscription(String id);

 Future<String> upgradeUserSubscription(Map<String, dynamic> requestBody);

 Future<String> updateUserSubscription(Map<String, dynamic> requestBody);

}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final ApiClient _client;

  UserRemoteDataSourceImpl(this._client);


@override
  Future<List<User>> getUsers() async {
    final response = await _client.get('${ApiConstants.BASE_URL}user/findAll');
    final drivers = User.fromJson(response) as  List<User>;
    return drivers;
  }

  
  @override
  Future<String> editUser(Map<String, dynamic> requestBody) async {
     final response = await _client.put(
      '${ApiConstants.BASE_URL}user/update',
      params: requestBody,
    );
     return (response['message']);
  }

  @override
  Future<User> getUserById(String id) async {
    final response = await _client.get('${ApiConstants.BASE_URL}user/findOne/$id');
    final user = User.fromJson(response);
    return user;
  }


 @override
   Future<UserSubscription> findUserSubscription(String id) async{
    // 
     final response = await _client.get('${ApiConstants.BASE_URL}user/findUserSubscription/$id');
      final user = UserSubscription.fromJson(response);
    return user;
   
  }


   @override
  Future<List<UserSubscription>> findAllUserSubscriptionsByDate(String startDate, String endDate) async{
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}user/findAllUserSubscriptionsByDate/', params: {
      
      'startDate': startDate,
      'endDate': endDate,
    });
    final userSubscriptions = UserSubscription.fromJson(response) as  List<UserSubscription>;
    return userSubscriptions;
   
  }

  @override
  Future<List<User>> getSearchedUsers(String searchTerm) async{
    // 
    final response = await _client.get('${ApiConstants.BASE_URL}user/findAllBySearch/', params: {
      'name': searchTerm,
    });
     final drivers = User.fromJson(response) as  List<User>;
    return drivers;
  }

  @override
  Future<String> saveUser(Map<String, dynamic> requestBody) async{
    // 
    final response = await _client.post(
      '${ApiConstants.BASE_URL}user/create',
      params: requestBody,
    );
     return (response['message']);
  }

  @override
  Future<String> upgradeUserSubscription(Map<String, dynamic> requestBody) async{
    // 
    final response = await _client.post(
      '${ApiConstants.BASE_URL}user/upgradeUserSubscription',
      params: requestBody,
    );
     return (response['message']);
  }

@override
  Future<String> updateUserSubscription(Map<String, dynamic> requestBody) async{
    // 
    final response = await _client.put(
      '${ApiConstants.BASE_URL}user/upgradeUserSubscription',
      params: requestBody,
    );
     return (response['message']);
  }


//findUserSubscription

  
//findAllUserSubscriptionsByDate

//upgradeUserSubscription

//updateUserSubscription

  


}