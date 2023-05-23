
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {

  start() async {
    if(Platform.isIOS){
      PermissionStatus photoIos = await Permission.photos.status;
      checkStatusPhotosIos(photoIos);
    }
    else
      {
        PermissionStatus photoAndroid = await Permission.storage.status;
        checkStatusPhotosAndroid(photoAndroid);
      }

  }

  Future<PermissionStatus>checkStatusPhotosIos(PermissionStatus status) async {
    switch(status){
      case PermissionStatus.permanentlyDenied : return Future.error("L'accès au photos est refusé");
      case PermissionStatus.denied : return await Permission.photos.request().then((value) => checkStatusPhotosIos(value));
      case PermissionStatus.limited : return await Permission.photos.request().then((value) => checkStatusPhotosIos(value));
      case PermissionStatus.restricted : return await Permission.photos.request().then((value) => checkStatusPhotosIos(value));
      case PermissionStatus.granted: return await Permission.photos.request().then((value) => checkStatusPhotosIos(value));
      default : return Future.error("Vous n'avez pas de status photos");
    }

  }


  Future<PermissionStatus>checkStatusPhotosAndroid(PermissionStatus status) async {
    switch(status){
      case PermissionStatus.permanentlyDenied : return Future.error("L'accès au photos est refusé");
      case PermissionStatus.denied : return await Permission.storage.request().then((value) => checkStatusPhotosAndroid(value));
      case PermissionStatus.limited : return await Permission.storage.request().then((value) => checkStatusPhotosAndroid(value));
      case PermissionStatus.restricted : return await Permission.storage.request().then((value) => checkStatusPhotosAndroid(value));
      case PermissionStatus.granted: return await Permission.storage.request().then((value) => checkStatusPhotosAndroid(value));
      default : return Future.error("Vous n'avez pas de status photos");
    }

  }

 }