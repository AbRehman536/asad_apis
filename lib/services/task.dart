import 'dart:convert';

import 'package:asad_apis/models/taskListing.dart';
import 'package:http/http.dart' as http;

class TaskServices{
  String BaseURL = "https://todo-nu-plum-19.vercel.app/";

  ///Create Task
  ///Get All Task
  ///Get InCompleted Task
  ///Get Completed Task
  ///Update Task
  ///Delete Task
  ///Search Task
  Future<TaskListingModel> searchTask({
    required String token,
    required String keyword,
  }) async{
    try{
      http.Response response = await http.get(
        Uri.parse('${BaseURL}/todos/search?keywords=$keyword'),
        headers : {'Authorization': token},);
      if(response.statusCode == 200 || response.statusCode == 201){
        return TaskListingModel.fromJson(json.decode(response.body));
      }else{
        throw Exception("Something went wrong");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
  ///Filter Task
  Future<TaskListingModel> filterTask({
    required String token,
    required String startDate, required String endDate
  }) async{
    try{
      http.Response response = await http.get(
        Uri.parse('${BaseURL}/todos/filter?startDate=$startDate&endDate=$endDate&='),
        headers : {'Authorization': token},);
      if(response.statusCode == 200 || response.statusCode == 201){
        return TaskListingModel.fromJson(json.decode(response.body));
      }else{
        throw Exception("Something went wrong");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}