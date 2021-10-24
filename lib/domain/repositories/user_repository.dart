import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/subscribe.dart';
import 'package:logisticsmobile/data/models/user.dart';

import '../../common/error/app_error.dart';

abstract class UserRepository {
  Future<Either<AppError, List<User>>> getUsers();
  
  Future<Either<AppError, User>> getUserById(String id);
 
  Future<Either<AppError, List<User>>> getSearchedUsers(
      String searchTerm);
  Future<Either<AppError, void>> saveUser(Map<String, dynamic> body);
  Future<Either<AppError, void>> editUser(Map<String, dynamic> body);
 Future<Either<AppError,List<UserSubscription>>> findAllUserSubscriptionsByDate(String startDate, String endDate);
  
  Future<Either<AppError,UserSubscription>> findUserSubscription(String id);

 Future<Either<AppError,String>> upgradeUserSubscription(Map<String, dynamic> requestBody);
 
 Future<Either<AppError,String>> updateUserSubscription(Map<String, dynamic> requestBody);


 // Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies();
 //Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
 // Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);
}