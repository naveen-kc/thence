import 'package:equatable/equatable.dart';
import '../models/treeModel.dart';



abstract class TreesState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TreeLoading extends TreesState{ }
class TreeInitial extends TreesState{ }

class TreeLoaded extends TreesState{
  final TreeModel trees;
  TreeLoaded({ required this.trees});
}
class TreeListError extends TreesState{

  final String?  error;
  TreeListError({this.error});
}