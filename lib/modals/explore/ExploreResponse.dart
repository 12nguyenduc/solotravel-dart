import 'package:solotravel/modals/explore/data.dart';

class ExploreResponse {
	ExploreResponse();

	int responseCode;
  Data data;

	ExploreResponse.fromJsonMap(Map<String, dynamic> map):
		responseCode = map["responseCode"],
		data = Data.fromJsonMap(map["data"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> dat = new Map<String, dynamic>();
		dat['responseCode'] = responseCode;
		dat['data'] = data == null ? null : data.toJson();
		return dat;
	}

}
