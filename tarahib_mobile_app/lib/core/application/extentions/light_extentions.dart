import 'package:stacked/stacked.dart';

extension RunBusyFutureExt<T> on Future<T> {
  Future<T> runBusyFutureExt(BaseViewModel viewModel) async {
    return await viewModel.runBusyFuture<T>(this);
  }
}

extension ListsExtraFunctionalities<T> on List<T> {
  void putIfAbsentAndRemoveIfExist(T item) {
    try {
      ///Remember that list is a reference type not value type
      ///so when assigning it to new list, indeed we assign reference not value
      ///Fill the final list
      final finalList = this;

      ///Check if list item is already exist
      final existenceIndex = finalList.indexOf(item);
      if (existenceIndex > -1) {
        ///Remove existed item in the linked list
        finalList.removeAt(existenceIndex);
      } else {
        ///Add this item to the list
        finalList.add(item);
      }

      ///

      return;
    } on Exception {
      rethrow;
    }
  }
}
