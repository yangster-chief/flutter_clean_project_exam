// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_project_exam/config/app_module.dart' as _i11;
import 'package:flutter_project_exam/config/module/hive_service.dart' as _i4;
import 'package:flutter_project_exam/data/todo_repository_impl.dart' as _i7;
import 'package:flutter_project_exam/datasource/local/app_dao.dart' as _i5;
import 'package:flutter_project_exam/datasource/remote/api_service.dart' as _i3;
import 'package:flutter_project_exam/domain/todo_repository.dart' as _i6;
import 'package:flutter_project_exam/domain/usecase/create_todo_usecase.dart'
    as _i9;
import 'package:flutter_project_exam/domain/usecase/get_todo_list_usecase.dart'
    as _i10;
import 'package:flutter_project_exam/domain/usecase/update_todo_usecase.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiService>(() => appModule.apiService);
    await gh.factoryAsync<_i4.HiveService>(
      () => appModule.hiveService,
      preResolve: true,
    );
    gh.singleton<_i5.AppDao>(_i5.AppDao(gh<_i4.HiveService>()));
    gh.singleton<_i6.ToDoRepository>(_i7.ToDoRepositoryImpl(
      gh<_i3.ApiService>(),
      gh<_i5.AppDao>(),
    ));
    gh.factory<_i8.UpdateToDoUseCase>(
        () => _i8.UpdateToDoUseCase(gh<_i6.ToDoRepository>()));
    gh.factory<_i9.CreateToDoUseCase>(
        () => _i9.CreateToDoUseCase(gh<_i6.ToDoRepository>()));
    gh.factory<_i10.GetToDoListUseCase>(
        () => _i10.GetToDoListUseCase(gh<_i6.ToDoRepository>()));
    return this;
  }
}

class _$AppModule extends _i11.AppModule {}
