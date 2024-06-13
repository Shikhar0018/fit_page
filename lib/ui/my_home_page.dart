import 'package:fit_page/data/fit_page_cubit.dart';
import 'package:fit_page/data/fit_page_stocks_model.dart';
import 'package:fit_page/helper/widgets/fit_page_shimmer.dart';
import 'package:fit_page/ui/stock_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FitPageCubit _fitPageCubit;

  @override
  void initState() {
    _fitPageCubit = BlocProvider.of<FitPageCubit>(context);
    _fitPageCubit.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<FitPageCubit, FitPageState>(
        builder: (context, state) {
          if (state is FitPageLoading) {
            return const Center(
              child: FitPageShimmer(),
            );
          } else if (state is FitPageLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                _fitPageCubit.fetchData();
              },
              child: ListView.builder(
                itemCount: state.fitPageData.length,
                itemBuilder: (context, index) {
                  return StockTile(
                    stockData: state.fitPageData[index],
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('Error fetching data'),
            );
          }
        },
      ),
    );
  }
}
