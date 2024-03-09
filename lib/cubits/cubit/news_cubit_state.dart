part of 'news_cubit_cubit.dart';

@immutable
sealed class NewsCubitState {}

final class NewsCubitInitial extends NewsCubitState {}
final class NewsSuccess extends NewsCubitState {
 final TopBussinessModel news ;

  NewsSuccess({required this.news});

}
final class NewsLoading extends NewsCubitState {}
final class NewsFailed extends NewsCubitState {}

