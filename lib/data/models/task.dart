import 'package:equatable/equatable.dart';

class Task extends Equatable{
  int id;
  String name;
  String description;
  bool isDeleted;

  List<Object> get props => [id, name, description,isDeleted];

  static fromMap(Map<String,dynamic> map){
    return new Task(map["id"], map["name"], map["description"], map["isDeleted"]);
  }

  Map<String, dynamic> toMap() {
    return {
    "id": id,
    "name": name,
    "description": description,
    "isDeleted": isDeleted
    };
  }

  Task(this.id, this.name, this.description,this.isDeleted);
  Task.newTask(String name, String description){
    this.id = null;
    this.name = name;
    this.description = description;
    this.isDeleted = false;
  }

}
