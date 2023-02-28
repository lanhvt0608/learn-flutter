import 'package:dartz/dartz.dart';
import 'package:section2/data/network/failure.dart';
import 'package:section2/data/request/request.dart';
import 'package:section2/data/response/responses.dart';
import 'package:section2/domain/model/model.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}


