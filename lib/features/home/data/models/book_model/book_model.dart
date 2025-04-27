import 'dart:convert';

import 'package:book_app/features/home/domain/entities/book_entity.dart';

import 'author.dart';
import 'formats.dart';

class BookModel extends BookEntity {
  int? id;
  String? title;
  List<Author>? authors;
  List<String>? summaries;
  List<String>? translators;
  List<String>? subjects;
  List<String>? bookshelves;
  List<String>? languages;
  bool? copyright;
  String? mediaType;
  Formats? formats;
  int? downloadCount;

  BookModel({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.translators,
    this.subjects,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    this.downloadCount,
  }) : super(
         bookId: id ?? 0,
         image: formats?.imageJpeg ?? 'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
         bookTitle: title ?? 'No Title Available',
         author:
             (authors != null && authors.isNotEmpty)
                 ? authors.first.name ?? 'No Author Available'
                 : 'No Author Available',
         summary:
             (summaries != null && summaries.isNotEmpty) ? summaries.first : 'No Summary Available',
       );

  factory BookModel.fromMap(Map<String, dynamic> data) => BookModel(
    id: data['id'] as int?,
    title: data['title'] as String? ?? 'No Title Available',
    authors:
        (data['authors'] as List<dynamic>?)
            ?.map((e) => Author.fromMap(e as Map<String, dynamic>))
            .toList(),
    summaries: (data['summaries'] as List<dynamic>?)?.cast<String>() ?? [],
    translators: (data['translators'] as List<dynamic>?)?.cast<String>() ?? [],
    subjects: (data['subjects'] as List<dynamic>?)?.cast<String>() ?? [],
    bookshelves: (data['bookshelves'] as List<dynamic>?)?.cast<String>() ?? [],
    languages: (data['languages'] as List<dynamic>?)?.cast<String>() ?? [],
    copyright: data['copyright'] as bool?,
    mediaType: data['media_type'] as String? ?? '',
    formats:
        data['formats'] == null ? null : Formats.fromMap(data['formats'] as Map<String, dynamic>),
    downloadCount: data['download_count'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': bookTitle,
    'authors': authors?.map((e) => e.toMap()).toList(),
    'summaries': summaries,
    'translators': translators,
    'subjects': subjects,
    'bookshelves': bookshelves,
    'languages': languages,
    'copyright': copyright,
    'media_type': mediaType,
    'formats': formats?.toMap(),
    'download_count': downloadCount,
  };

  factory BookModel.fromJson(Map<String, dynamic> data) {
    return BookModel.fromMap(data);
  }

  String toJson() => json.encode(toMap());
}
