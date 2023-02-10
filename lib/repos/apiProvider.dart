
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/treeModel.dart';


 class ApiProvider {
  final Dio dio = Dio();
  final String url = 'https://www.jsonkeeper.com/b/6Z9C';

  Future<TreeModel> getTrees() async{
   try{
    Response response = await dio.get(url);
    //log("  message :"+response.data);

    return TreeModel.fromJson(response.data);
   }catch (error, stackTrace){
    if(kDebugMode){
     print("Exception came :$error $stackTrace");
    }
    return TreeModel.withError('Please try again');
   }
  }

 }