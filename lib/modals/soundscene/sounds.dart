
class Sound {

	Sound();

	int id;
  int type;
  String title;
  String description;
  String img;
  String color;
  String mp3;

	Sound.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		type = map["type"],
		title = map["title"],
		description = map["description"],
		img = map["img"],
		color = map["color"],
		mp3 = map["mp3"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['type'] = type;
		data['title'] = title;
		data['description'] = description;
		data['img'] = img;
		data['color'] = color;
		data['mp3'] = mp3;
		return data;
	}

}
