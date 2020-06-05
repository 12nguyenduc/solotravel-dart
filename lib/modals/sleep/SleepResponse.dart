import 'data.dart';

class SleepResponse {



  int responseCode;
  Data data;

	SleepResponse.fromJsonMap(Map<String, dynamic> map):
		responseCode = map["responseCode"],
		data = Data.fromJsonMap(map["data"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> dat = new Map<String, dynamic>();
		dat['responseCode'] = responseCode;
		dat['data'] = data == null ? null : data.toJson();
		return dat;
	}

	SleepResponse();
}
