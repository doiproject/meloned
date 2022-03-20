import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class OpenWeatherAPICall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'OpenWeatherAPI',
      apiUrl:
          'https://api.openweathermap.org/data/2.5/weather?lat=9.131790&lon=99.333618&appid=2d0ed5e7b2b8fed7f13f1890cdc4b8ab',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic weather(dynamic response) => getJsonField(
        response,
        r'''$.weather''',
      );
}
