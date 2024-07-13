
class ShlokModel {
  String? name_sanskrit, name, text,hindi_meaning,transliteration;
  int? chapter_number;

  ShlokModel({this.transliteration,this.hindi_meaning,this.name_sanskrit, this.chapter_number, this.name, this.text});

  factory ShlokModel.mapToModel(Map m1) {
    return ShlokModel(
      transliteration: m1['transliteration'],
      hindi_meaning: m1['hindi_meaning'],
        name_sanskrit: m1['name_sanskrit'],
        chapter_number: m1['chapter_number'],
        name: m1['name'],
        text: m1['text']);
  }
}

class ChapterModel {
  int? chapter_number,id,verses_count;
  String? image_name,name_translation,text, name_sanskrit, imageUrl,name,chapter_summary,chapter_summary_hindi;
  ChapterModel(
      {this.image_name,this.name_translation,this.chapter_summary_hindi,this.chapter_summary,this.verses_count,this.name,this.text,this.id,this.name_sanskrit, this.chapter_number, this.imageUrl});

  factory ChapterModel.mapToModel(Map m1) {
    return ChapterModel(
      image_name: m1['image_name'],
      name_translation: m1['name_translation'],
      chapter_summary_hindi: m1['chapter_summary_hindi'],
      chapter_summary: m1['chapter_summary'],
      verses_count: m1['verses_count'],
      name: m1['name'],
      id: m1['id'],
        text: m1['text'],
        name_sanskrit: m1['name_sanskrit'],
        chapter_number: m1['chapter_number'],
        imageUrl: m1['imageUrl'],);
  }
}