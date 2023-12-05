import 'package:flutter/foundation.dart';
import 'package:movie_texo/core/failures/failure.dart';

abstract class Logger{
  logFailure(String source, Failure failure);
}

class DebugLogger implements Logger{
  @override
  logFailure(String source,Failure failure,) {
    if(kDebugMode){
      print("$source: ${failure.toString()}");
    }
  }
}