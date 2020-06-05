import 'package:solotravel/modals/sound.dart';

class Data {

  int id;
  String name;
  List<Sound> sounds;

	Data.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		name = map["name"],
		sounds = List<Sound>.from(map["sounds"].map((it) => Sound.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['sounds'] = sounds != null ?
			this.sounds.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
