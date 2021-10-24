import 'package:dartz/dartz.dart';
import 'package:logisticsmobile/data/models/company.dart';


import '../../common/error/app_error.dart';

abstract class CompanyRepository {
  Future<Either<AppError, List<Company>>> getCompanys();
  
  Future<Either<AppError, List<Company>>> getCompanyById(String id);
 
  Future<Either<AppError, List<Company>>> getSearchedTrips(
      String searchTerm);
  Future<Either<AppError, void>> saveTrip(Map<String, dynamic> body);
  Future<Either<AppError, void>> editTrip(Map<String, dynamic> body);

 // Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies();
 //Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
 // Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);
}