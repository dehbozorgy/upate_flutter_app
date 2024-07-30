
class UpdateModel {

  final String version;
  final bool force;

  UpdateModel(Map data) :
        version = data['version'] ,
        force = data['force'];

}