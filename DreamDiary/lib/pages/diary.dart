class Diary {
  String title;
  String content;
  String date;

  Diary({
    required this.title,
    required this.content,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'date': date,
  };

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
    title: json['title'],
    content: json['content'],
    date: json['date'],
  );
}
