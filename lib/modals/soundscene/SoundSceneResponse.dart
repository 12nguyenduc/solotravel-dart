import 'package:solotravel/modals/soundscene/data.dart';

class SoundSceneResponse {

	SoundSceneResponse();

  int responseCode;
  List<Data> data;

	SoundSceneResponse.fromJsonMap(Map<String, dynamic> map):
		responseCode = map["responseCode"],
		data = List<Data>.from(map["data"].map((it) => Data.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['responseCode'] = responseCode;
		data['data'] = data != null ?
			this.data.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
