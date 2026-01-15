import 'package:flutter/material.dart';
import 'package:flutter_application_2/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  List<ToDoEntity> todoList;

  HomeState(this.todoList);
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }

  //화면에
  //데이터를 농부를 통해서 가지고오게
  void saveToDo(ToDoEntity todo) {
    //상태업데이트:투드리스트에 투드추가하기
    state.todoList.add(todo);
    state = HomeState(state.todoList);
  }
}

//뷰모델 관리자 만들기
final HomeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
