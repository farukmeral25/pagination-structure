import 'package:pagination_structure/feature/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static final List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<HomeViewModel>(create: (context) => HomeViewModel()),
  ];
}
