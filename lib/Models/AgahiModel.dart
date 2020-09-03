class Advertising{


  var id;
  var userid;
  var title;
  var description;
  var date;
  var price;
  var category;
  var conditions;
  var location;



  Advertising.fromjson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    userid = parsedJson['userid'];
    title = parsedJson['title'];
    description = parsedJson['description'];
    date = parsedJson['date'];
    price = parsedJson['price'];
    category = parsedJson['category'];
    conditions = parsedJson['conditions'];
    location = parsedJson['location'];
  }
}



