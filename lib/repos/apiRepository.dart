

import 'package:thence/repos/apiProvider.dart';

import '../models/treeModel.dart';

class ApiRepository{
  final provider= ApiProvider();
  Future<TreeModel> getTreeList(){
    return provider.getTrees();

  }
}

class NetworkError extends Error{

}