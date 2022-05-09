import 'dart:convert';

class ResponseItem {
  final String id;
  final String province_id;
  final String name;
  bool isSelected;

  ResponseItem({
    required this.id,
    required this.province_id,
    required this.name,
    this.isSelected = false,
  });


  void toggleSelection(){
    isSelected = !isSelected;
  }

  ResponseItem copyWith({
    String? id,
    String? province_id,
    String? name,
    bool? isSelected,
  }) {
    return ResponseItem(
      id: id ?? this.id,
      province_id: province_id ?? this.province_id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'province_id': province_id,
      'name': name,
      'isSelected': isSelected,
    };
  }

  factory ResponseItem.fromMap(Map<String, dynamic> map) {
    return ResponseItem(
      id: map['id'] ?? '',
      province_id: map['province_id'] ?? '',
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseItem.fromJson(String source) => ResponseItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResponseItem(id: $id, province_id: $province_id, name: $name, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ResponseItem &&
      other.id == id &&
      other.province_id == province_id &&
      other.name == name &&
      other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      province_id.hashCode ^
      name.hashCode ^
      isSelected.hashCode;
  }
}
