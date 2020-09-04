import 'base_entity.dart';

class TodoEntity extends BaseEntity {
  final String title;
  final String content;
  TodoEntity({id, this.title, this.content}) : super(id);

  factory TodoEntity.fromJson(Map<String, dynamic> json) {
    return TodoEntity(
        id: json['id'], title: json['title'], content: json['content']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'content': this.content,
    };
  }
}
