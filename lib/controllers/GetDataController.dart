import 'dart:convert';
import 'package:elisay_fluter_pokemon/models/getDataModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetDataController extends GetxController{
  //iniciamos unas variables
  var isLoading = false.obs;
  var getDataModel = GetDataModel(results: []).obs;


  //Creamos una Funcion
  //Obtenemos LA Informacion de Nuestra Api
  getDataFromApi() async {
    isLoading.value = true;
    try{
      var response = await Dio().get(
          'http://192.168.1.22/pokemonjson/controller/pokemon.php?op=listar');
      final datax = json.decode(response.data);//Con esto convertemos la cadena
      getDataModel.value = GetDataModel.fromJson(datax); //Aca ya se pone la cadena convertida
      isLoading.value = false;
    }catch (e){
      print(e);
    }
  }  
}