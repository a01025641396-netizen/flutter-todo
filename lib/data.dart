class ToDoEntity {
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;

  ToDoEntity({
    //제목
    required this.title,
    //설명
    required this.description,
    //내가 좋아하는 것
    required this.isFavorite,
    //완료여부
    required this.isDone,
  });
}
