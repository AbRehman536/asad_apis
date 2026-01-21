import 'dart:convert';

import 'package:asad_apis/models/login.dart';
import 'package:asad_apis/models/register.dart';
import 'package:asad_apis/models/user.dart';
import 'package:http/http.dart' as http;

class AuthServices{
  String BaseURL = "https://todo-nu-plum-19.vercel.app/";
  ///Register User
  Future<RegisterModel> registerUser({
    required String name,
    required String email,
    required String password,
}) async{
    try{
      http.Response response = await http.post(
        Uri.parse('${BaseURL}/users/register'),
          headers : {'Content-Type': 'application/json'},
          body : json.encode({"name": name, "email": email, "password": password}),);
      if(response.statusCode == 200 || response.statusCode == 201){
        return RegisterModel.fromJson(json.decode(response.body));
      }else{
        throw Exception("Something went wrong");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
  ///Login User
  Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async{
    try{
      http.Response response = await http.post(
        Uri.parse('${BaseURL}/users/login'),
        headers : {'Content-Type': 'application/json'},
        body : json.encode({"email": email, "password": password}),);
      if(response.statusCode == 200 || response.statusCode == 201){
        return LoginModel.fromJson(json.decode(response.body));
      }else{
        throw Exception("Something went wrong");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
  ///Get Profile
  Future<UserModel> getProfile(String token) async{
    try{
      http.Response response = await http.get(
        Uri.parse('${BaseURL}/users/profile'),
        headers : {'Authorization': token},);
      if(response.statusCode == 200 || response.statusCode == 201){
        return UserModel.fromJson(json.decode(response.body));
      }else{
        throw Exception("Something went wrong");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
  ///Update Profile
  Future<bool> updateProfile({
    required String token, required String name}) async{
    try{
      http.Response response = await http.put(
        Uri.parse('${BaseURL}/users/profile'),
        headers : {'Authorization': token, 'Content-Type': 'application/json'},
        body : json.encode({"name": name,}),);
      if(response.statusCode == 200 || response.statusCode == 201){
        return true;
      }else{
        throw Exception("Something went wrong");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}