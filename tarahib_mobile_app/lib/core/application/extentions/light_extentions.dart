import 'package:stacked/stacked.dart';

extension RunBusyFutureExt<T> on Future<T> {
  Future<T> runBusyFutureExt(BaseViewModel viewModel) async {
   return await viewModel.runBusyFuture<T>(this);
  }
}
