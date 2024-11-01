 

class TagsModel {
  String? id;
  String? title;


  TagsModel({ this.id,   this.title});

  TagsModel.fromjson(Map<String,dynamic> json){
  id = json["id"];
  title = json["title"];}

}
