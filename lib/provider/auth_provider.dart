import 'package:fluent_ui/fluent_ui.dart';

import '../api/service_api.dart';

class AuthProvider extends ChangeNotifier {
  bool _connexionIsLoading = false;
  int? _topIndex = 0;
  List _listUtilisateur = [];
  var service = ServiceApi();

  bool? get connexionIsLoading => _connexionIsLoading;
  List? get listUtilisateur => _listUtilisateur;
  int? get topIndex => _topIndex;

  changeValConnexionIsLoading(bool val) {
    _connexionIsLoading = val;
    notifyListeners();
  }

  changeHomeIndex(int index) {
    _topIndex = index;
    notifyListeners();
  }

  initDataUtilisateur({required String? email}) async {
    _listUtilisateur = await service.getUserList(email: email);
    notifyListeners();
  }
}
