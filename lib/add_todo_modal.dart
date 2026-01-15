import 'package:flutter/material.dart';
import 'package:flutter_application_2/data.dart';

// addTodo(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         child: Padding(
//           padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 12),

//           child: Text(''),
//         ),
//       );
//     },
//   );
// }

class AddTodo extends StatefulWidget {
  const AddTodo({super.key, required this.addtodo});
  final void Function(ToDoEntity) addtodo;
  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  @override
  void dispose() {
    titlecontroller.dispose();
    descriptioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12),

      child: Container(
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(hintText: '새 할 일'),
            ),

            TextField(
              controller: descriptioncontroller,
              decoration: InputDecoration(hintText: '세부정보 추가'),
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.short_text)),
                IconButton(onPressed: () {}, icon: Icon(Icons.star_border)),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    ToDoEntity todo = ToDoEntity(
                      title: titlecontroller.text,
                      description: descriptioncontroller.text,
                      isFavorite: false,
                      isDone: false,
                    );
                    // 1번 파이어 페이스 콘솔들어가서 프로젝트 만들기
                    //2번 플러터 프로젝트에 파이어 베이스 연동하기
                    widget.addtodo(todo);
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Text(
                      "저장",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
