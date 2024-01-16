import 'package:uuid/uuid.dart';

class Note {
  final String id;
  final String title;
  final String description;

  Note({
    String? id,
    required this.title,
    required this.description,
  }) : id = const Uuid().v4();

  Note copyWith({
    String? title,
    String? description,
  }) {
    return Note(
      id: id, // behält die ursprüngliche UUID bei
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  String toString() => 'Note (id: $id, title: $title, description: $description)';

  // Saving the Note to a json file
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // Loading the Note from a json file
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}
