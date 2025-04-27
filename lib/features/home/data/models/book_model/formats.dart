class Formats {
  String? textHtml;
  String? applicationEpubZip;
  String? applicationXMobipocketEbook;
  String? applicationRdfXml;
  String? imageJpeg;
  String? textPlainCharsetUsAscii;
  String? applicationOctetStream;

  Formats({
    this.textHtml,
    this.applicationEpubZip,
    this.applicationXMobipocketEbook,
    this.applicationRdfXml,
    this.imageJpeg,
    this.textPlainCharsetUsAscii,
    this.applicationOctetStream,
  });

  factory Formats.fromMap(Map<String, dynamic> data) => Formats(
    textHtml: data['text/html'] as String? ?? '', // Default to empty string if null
    applicationEpubZip: data['application/epub+zip'] as String? ?? '',
    applicationXMobipocketEbook: data['application/x-mobipocket-ebook'] as String? ?? '',
    applicationRdfXml: data['application/rdf+xml'] as String? ?? '',
    imageJpeg: data['image/jpeg'] as String? ?? '',
    textPlainCharsetUsAscii: data['text/plain; charset=us-ascii'] as String? ?? '',
    applicationOctetStream: data['application/octet-stream'] as String? ?? '',
  );

  Map<String, dynamic> toMap() => {
    'text/html': textHtml,
    'application/epub+zip': applicationEpubZip,
    'application/x-mobipocket-ebook': applicationXMobipocketEbook,
    'application/rdf+xml': applicationRdfXml,
    'image/jpeg': imageJpeg,
    'text/plain; charset=us-ascii': textPlainCharsetUsAscii,
    'application/octet-stream': applicationOctetStream,
  };

  /// `dart:convert`
  ///
  /// Parses
}
