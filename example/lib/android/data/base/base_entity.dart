


abstract class BaseEntity{

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}

