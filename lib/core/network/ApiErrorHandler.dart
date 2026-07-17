import 'package:dio/dio.dart';
import 'package:kinguard/core/utils/deep_Link/Context_Utility.dart';

class ApiErrorHandler {
  static String handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      throw "An error occured please try again!";
    } else if (e.type == DioExceptionType.badResponse && e.response != null) {
      final response = e.response!;
      final statusCode = response.statusCode;

      if (response.data != null && response.data['errors'] != null) {
        final errors = response.data['errors'];
        String errorMessage = errors.entries
            .map((entry) {
              return (entry.value is List)
                  ? entry.value.join("\n")
                  : entry.value.toString();
            })
            .join("\n");

        throw errorMessage;
      }

      if (statusCode == 401) {
        LogoutUser().logout(ContextUtility.context!);
      } else if (statusCode == 503) {
        throw "Oops! Something Went Wrong";
      } else if (e.response!.statusCode == 422 ||
          e.response!.statusCode == 400 ||
          e.response!.statusCode == 500 ||
          e.response!.statusCode == 404) {
        throw response.data['status'].toString() == "false"
            ? response.data['message']
            : "Oops! Something Went Wrong";
      } else {
        throw "Oops! Something Went Wrong";
      }
    }

    throw "Oops! Something Went Wrong";
  }
}
