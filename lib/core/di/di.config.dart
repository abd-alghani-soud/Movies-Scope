// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/data_source/data_home.dart' as _i777;
import '../../features/home/data/repository/repo_home.dart' as _i1024;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i202;
import '../../features/search/data/data_source/search_data_source.dart'
    as _i294;
import '../../features/search/data/repository/search_repo.dart' as _i822;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i552;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i777.DataHome>(() => _i777.DataHome());
    gh.factory<_i294.SearchDataSource>(() => _i294.SearchDataSource());
    gh.factory<_i822.SearchRepo>(
        () => _i822.SearchRepo(searchDataSource: gh<_i294.SearchDataSource>()));
    gh.lazySingleton<_i552.SearchBloc>(
        () => _i552.SearchBloc(gh<_i822.SearchRepo>()));
    gh.factory<_i1024.RepoHome>(
        () => _i1024.RepoHome(data: gh<_i777.DataHome>()));
    gh.lazySingleton<_i202.HomeBloc>(
        () => _i202.HomeBloc(gh<_i1024.RepoHome>()));
    return this;
  }
}
