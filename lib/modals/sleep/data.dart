import 'package:solotravel/modals/sound.dart';

class Data {

  List<Sound> SleepAid;
  List<Sound> Night;
  List<Sound> Daytime;

	Data.fromJsonMap(Map<String, dynamic> map):
		SleepAid = List<Sound>.from(map["SleepAid"].map((it) => Sound.fromJsonMap(it))),
		Night = List<Sound>.from(map["Night"].map((it) => Sound.fromJsonMap(it))),
		Daytime = List<Sound>.from(map["Daytime"].map((it) => Sound.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['SleepAid'] = SleepAid != null ?
			this.SleepAid.map((v) => v.toJson()).toList()
			: null;
		data['Night'] = Night != null ?
			this.Night.map((v) => v.toJson()).toList()
			: null;
		data['Daytime'] = Daytime != null ?
			this.Daytime.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
