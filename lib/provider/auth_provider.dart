import 'package:fluent_ui/fluent_ui.dart';

import '../api/service_api.dart';

class AuthProvider extends ChangeNotifier {
  bool _connexionIsLoading = false;
  int? _topIndex = 0;
  List _listUtilisateur = [];
  List _listCredit = [];
  var service = ServiceApi();

  bool? get connexionIsLoading => _connexionIsLoading;
  List? get listUtilisateur => _listUtilisateur;
  List? get listCredit => _listCredit;
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

  initDataCredit() async {
    _listCredit = await service.getCreditList();
    notifyListeners();
  }

  searchInListUtilisateur(String query, var keys) {
    dynamic results = [];
    if (query.isEmpty) {
      results = _listUtilisateur;
    } else {
      results = _listUtilisateur
          .where((element) => element[keys]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    _listUtilisateur = results;
    notifyListeners();
  }

  searchInListCredits(String query, var keys) {
    dynamic results = [];
    if (query.isEmpty) {
      results = _listCredit;
    } else {
      results = _listCredit
          .where((element) => element[keys]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    _listCredit = results;
    notifyListeners();
  }
}
