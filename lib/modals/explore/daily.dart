
class Daily {

	Daily();

	int id;
  int time;
  String quote;
  String author;
  int countLike;
  String img;
  List<String> userLike;

	Daily.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		time = map["time"],
		quote = map["quote"],
		author = map["author"],
		countLike = map["countLike"],
		img = map["img"],
		userLike = List<String>.from(map["userLike"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['time'] = time;
		data['quote'] = quote;
		data['author'] = author;
		data['countLike'] = countLike;
		data['userLike'] = userLike;
		data['img'] = img;
		return data;
	}

}
