class InterShip{

  var id;
  var userid;
  var title;
  var company;
  var date;
  var numberinternship;
  var time_work;
  var type;
  var description	;
  var category;
  var address;
  var image;
  var phonenumber;
  var conditions;




  InterShip.fromjson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    userid = parsedJson['userid'];
    title = parsedJson['title'];
    company = parsedJson['company'];
    date = parsedJson['date'];
    numberinternship = parsedJson['numberinternship'];
    time_work = parsedJson['time_work'];
    type = parsedJson['type'];
    description = parsedJson['description'];
    category = parsedJson['category'];
    address = parsedJson['address'];
    image = parsedJson['image'];
    phonenumber = parsedJson['phonenumber'];
    conditions = parsedJson['conditions'];
  }
}