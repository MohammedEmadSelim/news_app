import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/models/news_model.dart';
import 'package:news/repository/new_repo.dart';
import 'package:news/screens/homa.dart';

part 'news_cubit_state.dart';

class NewsCubitCubit extends Cubit<NewsCubitState> {
  NewsCubitCubit() : super(NewsCubitInitial());

  void getNews() async {
    try {
      emit(NewsLoading());
      final news = await TopBussinesNewsRepo().fetchData();
      emit(NewsSuccess(news: news));
    } catch (e) {
      emit(NewsFailed());
    }
  }
}
