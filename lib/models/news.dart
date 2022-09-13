import 'dart:convert';

class News {
  final String? id;
  final String title;
  final String author;
  final String content;
  final String image;
  final String imageNewsletter;
  final String date;

  News({
    this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.image,
    required this.imageNewsletter,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'content': content,
      'image': image,
      'imageNewsletter': imageNewsletter,
      'date': date,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['_id'],
      title: map['title'] as String,
      author: map['author'] as String,
      content: map['content'] as String,
      image: map['image'] as String,
      imageNewsletter: map['imageNewsletter'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source) as Map<String, dynamic>);
}
