
class Sound {

	Sound();

	int id;
  int type;
  bool plus;
  String title;
  String description;
  String img;
  String color;
  String mp3;
  String url;

	Sound.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		type = map["type"],
		title = map["title"],
		description = map["description"],
		img = map["img"],
		color = map["color"],
		mp3 = map["mp3"],
		url = map["url"],
		plus = map["plus"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['type'] = type;
		data['title'] = title;
		data['description'] = description;
		data['img'] = img;
		data['color'] = color;
		data['mp3'] = mp3;
		data['url'] = url;
		data['plus'] = plus;
		return data;
	}

}
