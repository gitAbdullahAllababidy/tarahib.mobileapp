import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

mixin ModelsMixin<ViewModel extends BaseViewModel> {
  ViewModel get viewModel =>
      Provider.of<ViewModel>(StackedService.navigatorKey!.currentContext!);
}
