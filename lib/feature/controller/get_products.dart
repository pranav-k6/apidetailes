import 'package:dio/dio.dart';
import 'package:get_api_products/feature/model/get_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<NewApi>>productdetails()async{
 final Dio _dio=Dio();
  Response response=await _dio.get('https://fakestoreapi.com/products');
  if(response.statusCode==200){
    List<dynamic>result=response.data;
    List<NewApi>product=result.map((e) => NewApi.fromJson(e)).toList();
    return product;
  }else {
    throw Exception('error:${response.statusCode}');
  }
}