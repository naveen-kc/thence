import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thence/blocs/tree_event.dart';
import 'package:thence/blocs/tree_state.dart';
import 'package:thence/repos/apiRepository.dart';

import '../models/treeModel.dart';
import '../repos/apiProvider.dart';

class TreesBloc extends Bloc<TreeEvents,TreesState>
{

TreesBloc():super(TreeInitial()){
  final ApiRepository treeRepository =ApiRepository();



  on< GetTreeList > ((event,emit)async
  {
    try {
      emit(TreeLoading());
      final treeList = await treeRepository.getTreeList();
      emit(TreeLoaded(trees: treeList));
      // if(treeList.e != null) {
      //   emit(TreeListError(error: treeList.error));
      // }

    }
    on NetworkError {
      emit(TreeListError(error: 'Failed to connect ti Internet'));
    }
  });


  }

}











/*  final TreeRepository treesrepository;
  late List<Data> listTrees;
  TreesBloc({required this.treesrepository}) : super(TreeInitialState());

  @override
  Stream<TreesState> mapEventToState(TreeEvents event) async* {

    switch(event)
    {
      case TreeEvents.fetchTrees:

        yield  TreeLoadingState();

        try {
          listTrees = await treesrepository.getTrees();

          yield TreeLoadedState(trees: listTrees);

        }on SocketException {
          yield TreeListErrorstate(
            error: ('No Internet'),
          );
        } on HttpException {
          yield TreeListErrorstate(
            error: ('No Service'),
          );
        } on FormatException {
          yield TreeListErrorstate(
            error: ('No Format Exception'),
          );
        } catch (e) {
          print(e.toString());
          yield TreeListErrorstate(
            error: ('Un Known Error ${e.toString()}'),
          );
        }
        break;
    }

  }*/

