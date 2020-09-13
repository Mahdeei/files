class Comment{
  var id;
  var user_comment;
  var comment_id;
  var comment_text;
  var date;
  var username;

  Comment.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson['id'];
    user_comment = parsedJson['user_comment'];
    comment_id = parsedJson['comment_id'];
    comment_text = parsedJson['comment_text'];
    date = parsedJson['date'];
    username = parsedJson['username'];
  }
}