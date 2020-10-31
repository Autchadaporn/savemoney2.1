import 'dart:convert';
// {
//   "tags": [
//     {
//       "name": "dart",
//       "quantity": 12
//     },
//     {
//       "name": "flutter",
//       "quantity": 25
//     },
//     {
//       "name": "json",
//       "quantity": 8
//     }
//   ]
// }
class Tag {
  String name;
  int quantity;

  Tag(this.name, this.quantity);

  factory Tag.fromJson(dynamic json) {
    return Tag(json['name'] as String, json['quantity'] as int);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.quantity} }';
  }
}
main() {
  String arrayObjsText =
      '{"tags": [{"name": "dart", "quantity": 12}, {"name": "flutter", "quantity": 25}, {"name": "json", "quantity": 8}]}';

  var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
  List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();

  print(tagObjs);
}