import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_todo_modal.dart';
import 'package:flutter_application_2/data.dart';
import 'package:flutter_application_2/empty.dart';
import 'package:flutter_application_2/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(HomeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "승현`s Tasks",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      backgroundColor: Colors.grey,

      // 투드리스트가 비어있을때는 엠티위젯 비어있지안을때는 리스트뷰로 투드리스트보여주기
      body: homeState.todoList.isEmpty
          ? Empty()
          : ListView.builder(
              itemCount: homeState.todoList.length,
              itemBuilder: (context, index) {
                ToDoEntity todo = homeState.todoList[index];
                return Padding(
                  padding: const EdgeInsetsGeometry.only(left: 20, right: 20),

                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 12),
                        IconButton(
                          onPressed: () {
                            final viewModel = ref.read(
                              HomeViewModelProvider.notifier,
                            );
                            viewModel.isDones(todo);
                          },
                          icon: Icon(
                            !todo.isDone ? Icons.circle : Icons.check_circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '${todo.title}',
                          style: TextStyle(
                            decoration: todo.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            final viewModel = ref.read(
                              HomeViewModelProvider.notifier,
                            );
                            viewModel.isFavorites(todo);
                          },
                          icon: Icon(
                            todo.isFavorite ? Icons.star_border : Icons.star,
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                    ),
                  ),
                );
              },
            ),

      // 1 깃허브 레포지토리만들어서 업로드
      //2 업로드하고 리버팟 이용해서 상태 관리해보기
      //뷰모델 관리자만들기 상태 클래스,뷰모델만들기
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   todoList.add(
          //     ToDoEntity(
          //       title: '새할일',
          //       description: null,
          //       isFavorite: false,
          //       isDone: false,
          //     ),
          //   );
          // });
          //모달바텀시트에서 제목을 입력하고 저장을 누르면 두트리스트에 입력한 제목이 들어가 있는 두트엔티추가하기

          showModalBottomSheet(
            context: context,
            builder: (context) {
              final viewModel = ref.read(HomeViewModelProvider.notifier);
              return AddTodo(addtodo: viewModel.saveToDo);
            },
          );
        },

        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: Icon(Icons.add, size: 24, color: Colors.white),
      ),
    );
  }
}
