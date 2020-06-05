import 'package:solotravel/modals/sound.dart';

class Data {

  Sound Daily;
  List<Sound> Singles;
  List<Sound> Basic;
  List<Sound> Series;

	Data.fromJsonMap(Map<String, dynamic> map):
		Daily = Sound.fromJsonMap(map["Daily"]),
		Singles = List<Sound>.from(map["Singles"].map((it) => Sound.fromJsonMap(it))),
		Basic = List<Sound>.from(map["Basic"].map((it) => Sound.fromJsonMap(it))),
		Series = List<Sound>.from(map["Series"].map((it) => Sound.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Daily'] = Daily != null ?
		this.Daily.toJson() : null;
		data['Singles'] = Singles != null ?
			this.Singles.map((v) => v.toJson()).toList()
			: null;
		data['Basic'] = Basic != null ?
			this.Basic.map((v) => v.toJson()).toList()
			: null;
		data['Series'] = Series != null ?
			this.Series.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
