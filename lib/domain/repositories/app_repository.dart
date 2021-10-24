import 'package:dartz/dartz.dart';
import '../../common/error/app_error.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
  Future<Either<AppError, void>> updateTheme(String theme);
  Future<Either<AppError, String>> getPreferredTheme();
}
