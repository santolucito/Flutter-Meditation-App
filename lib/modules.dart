import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

dynamic moduleInfo;

Future<void> loadModules() async {
  final yamlString = await rootBundle.loadString('assets/modules/modules.yaml');
  final yamlData = loadYaml(yamlString);
  print(yamlData);
  moduleInfo = yamlData;
}
