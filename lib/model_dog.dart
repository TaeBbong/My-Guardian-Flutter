import 'package:my_guardian/model_guard.dart';

class Dog {
  int index;
  String name;
  String type;
  String sex;
  String age;
  String vac;
  String mid;
  String spec;
  int guard;
  String imageName;

  Dog({
    this.index,
    this.name,
    this.type,
    this.sex,
    this.age,
    this.imageName,
    this.vac,
    this.mid,
    this.spec,
    this.guard,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    String emptySpec = "안녕하세요.";
    return Dog(
      index: json['pk'] as int,
      name: json['name'] as String,
      type: json['dog_type'] as String,
      sex: json['sex'] as String,
      age: json['age'].toString() as String,
      imageName: json['image'] as String,
      vac: json['vac'] as String,
      mid: json['mid'] as String,
      // spec: json['spec'] ? json['spec'] : "안녕하세요" as String,
      spec: json['spec'] as String,
      guard: json['guard'] as int,
    );
  }
}
