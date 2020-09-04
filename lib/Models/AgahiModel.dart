
class Advertising{
  var id;
  var user_id;
  var title;
  var description;
  var date;
  var price;
  var category;
  var conditions;
  var location;


  Advertising.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    user_id = parsedJson['user_id'];
    title = parsedJson['title'];
    description = parsedJson['description'];
    date = parsedJson['date'];
    price = parsedJson['price'];
    category = parsedJson['category'];
    conditions = parsedJson['conditions'];
    location = parsedJson['location'];
  }
}



