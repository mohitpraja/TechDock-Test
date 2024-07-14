import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppPreferences {
  AppPreferences._privateConstructor();
  static final AppPreferences _instance = AppPreferences._privateConstructor();

  static AppPreferences get instance => _instance;

  late Box<dynamic> _box;

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    // await Hive.initFlutter();
    _box = await Hive.openBox('recipefinder');
  }

  Box<dynamic> get hiveDb => _box;
   
  String get favouriteList => _box.get('favouriteList') ?? '';
  set favouriteList(String value) => _box.put('favouriteList', value);

}
