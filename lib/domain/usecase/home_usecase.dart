import 'package:section2/data/network/failure.dart';
import 'package:section2/domain/model/model.dart';
import 'package:section2/domain/repository/repository.dart';
import 'package:section2/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase extends BaseUseCase<void, HomeObject> {
  Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHome();
  }
}
