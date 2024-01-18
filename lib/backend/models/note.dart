import 'package:uuid/uuid.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final DateTime dateCreated;
  final DateTime dateLastUpdated;
  final DateTime dateLastOpened;

  Note({
    String? id,
    required this.title,
    required this.description,
    DateTime? dateCreated,
    DateTime? dateLastUpdated,
    DateTime? dateLastOpened,
  })  : id = const Uuid().v4(),
        dateCreated = DateTime.now(),
        dateLastUpdated = DateTime.now(),
        dateLastOpened = DateTime.now();

  Note copyWith({
    String? title,
    String? description,
    bool? isUpdated,
  }) {
    return Note(
      id: id, // behält die ursprüngliche UUID bei
      title: title ?? this.title,
      description: description ?? this.description,
      dateCreated: dateCreated,
      dateLastUpdated: isUpdated == true ? DateTime.now() : dateLastUpdated,
      dateLastOpened: DateTime.now(),
    );
  }

  @override
  String toString() => 'Note (id: $id, title: $title, description: $description, dateCreated: $dateCreated, dateLastUpdated: $dateLastUpdated, dateLastOpened: $dateLastOpened)';

  // Saving the Note to a json file
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateCreated': dateCreated.toString(),
      'dateLastUpdated': dateLastUpdated.toString(),
      'dateLastOpened': dateLastOpened.toString(),
    };
  }

  // Loading the Note from a json file
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dateCreated: DateTime.parse(map['dateCreated']),
      dateLastUpdated: DateTime.parse(map['dateLastUpdated']),
      dateLastOpened: DateTime.parse(map['dateLastOpened']),
    );
  }
}
