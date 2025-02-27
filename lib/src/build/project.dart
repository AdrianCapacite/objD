import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';

class Project {
  String target = './';
  final String name;
  final String description;
  final double version;
  Widget generate;

  /// The project is a special Widget which is just defined once.
  ///
  /// It contains some built options, like description or name, but also the entire underlying tree of packs, files and actions.
  ///
  /// ```dart
  ///main() {
  ///// create Project takes in one project and compiles it
  ///createProject(
  ///	Project(
  ///	name:  'tested',
  ///	generate:  mainWidget(),
  ///	));
  ///}
  ///```
  Project({
    required this.name,
    required this.generate,
    this.version = 16,
    this.target = './',
    this.description = 'This is a datapack generated with objd by Stevertus',
  });

  Map toMap() => {
        'Project': {
          'name': name,
          'version': version,
          'generate': generate
              .generate(
                Context(
                  prefixes: [],
                  suffixes: [],
                  packId: '',
                  version: version,
                ),
              )
              .toMap()
        }
      };

  int getPackFormat() {
    if (version >= 19.4) return 12;
    if (version > 19.3) return 11;
    if (version >= 19) return 10;
    if (version >= 18.2) return 9;
    if (version >= 18) return 8;
    if (version >= 17) return 7;
    if (version >= 16) return 6;
    if (version >= 15) return 5;
    return 4;
  }
}
