import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TreeEvents extends Equatable{
  const TreeEvents();

  List<Object> get props => [];
}

class GetTreeList extends TreeEvents{}