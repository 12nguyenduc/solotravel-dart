import 'package:solotravel/modals/explore/daily.dart';
import 'package:solotravel/modals/sound.dart';

class Data {

  String title;
  List<Sound> highlight;
  List<Sound> sound;
  List<Sound> meditation;
  List<Sound> sleep;
  Daily daily;
  List<Sound> blog;
  List<Sound> minis;

	Data.fromJsonMap(Map<String, dynamic> map):
		title = map["title"],
		highlight = List<Sound>.from(map["highlight"].map((it) => Sound.fromJsonMap(it))),
		sound = List<Sound>.from(map["sound"].map((it) => Sound.fromJsonMap(it))),
		meditation = List<Sound>.from(map["meditation"].map((it) => Sound.fromJsonMap(it))),
		sleep = List<Sound>.from(map["sleep"].map((it) => Sound.fromJsonMap(it))),
				minis = List<Sound>.from(map["minis"].map((it) => Sound.fromJsonMap(it))),
		daily = Daily.fromJsonMap(map["daily"]),
		blog = List<Sound>.from(map["blog"].map((it) => Sound.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = title;
		data['highlight'] = highlight != null ?
			this.highlight.map((v) => v.toJson()).toList()
			: null;
		data['sound'] = sound != null ?
			this.sound.map((v) => v.toJson()).toList()
			: null;
		data['meditation'] = meditation != null ?
			this.meditation.map((v) => v.toJson()).toList()
			: null;
		data['sleep'] = sleep != null ?
			this.sleep.map((v) => v.toJson()).toList()
			: null;
		data['minis'] = minis != null ?
			this.minis.map((v) => v.toJson()).toList()
			: null;
		data['daily'] = daily == null ? null : daily.toJson();
		data['blog'] = blog != null ?
			this.blog.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
