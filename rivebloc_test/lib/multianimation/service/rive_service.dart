import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveService {
  
  getFile() async {
    return RiveFile.import(await rootBundle.load('assets/multy2.riv'));
  }

}