import 'dart:convert';

class Stuff {
  int id;
  String description;
  String contactName;
  DateTime loanDate;
  String photoPath;
  String telefone;

  Stuff(
      {this.id,
      this.description,
      this.contactName,
      this.loanDate,
      this.photoPath,
      this.telefone});

  String get loadDateString =>
      '${loanDate.day.toString().padLeft(2, '0')}/${loanDate.month.toString().padLeft(2, '0')}';

  bool get photoExist => photoPath != null && photoPath.isNotEmpty;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'contactName': contactName,
      'loanDate': loanDate.millisecondsSinceEpoch,
      'photoPath': photoPath,
      'telefone': telefone
    };
  }

  static Stuff fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Stuff(
        id: map['id'],
        description: map['description'],
        contactName: map['contactName'],
        loanDate: DateTime.fromMillisecondsSinceEpoch(map['loanDate']),
        photoPath: map['photoPath'],
        telefone: map['telefone']);
  }

  String toJson() => json.encode(toMap());

  static Stuff fromJson(String source) => fromMap(json.decode(source));

  Stuff copyWith(
      {int id,
      String description,
      String contactName,
      DateTime loanDate,
      String photoPath,
      String telefone}) {
    return Stuff(
        id: id ?? this.id,
        description: description ?? this.description,
        contactName: contactName ?? this.contactName,
        loanDate: loanDate ?? this.loanDate,
        photoPath: photoPath ?? this.photoPath,
        telefone: telefone ?? this.telefone);
  }

  @override
  String toString() {
    return 'Stuff(id: $id, description: $description, contactName: $contactName, loanDate: $loanDate, photoPath: $photoPath, telefone: $telefone)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Stuff &&
        o.id == id &&
        o.description == description &&
        o.contactName == contactName &&
        o.loanDate == loanDate &&
        o.photoPath == photoPath &&
        o.telefone == telefone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        contactName.hashCode ^
        loanDate.hashCode ^
        photoPath.hashCode ^
        telefone.hashCode;
  }
}
