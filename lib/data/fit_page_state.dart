part of 'fit_page_cubit.dart';

abstract class FitPageState {}

class FitPageInitial extends FitPageState {}

class FitPageLoading extends FitPageState {}

class FitPageLoaded extends FitPageState {
  final List<FitPageStocksModel> fitPageData;

  FitPageLoaded({required this.fitPageData});
}
