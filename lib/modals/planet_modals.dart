class Planet_Modals{

  final String name;
  final String type;
  final String image;
  final String description;
  final String data;
  final String mass;
  final String volume;
  final String surface;
  final String gravity;
  final String escapevelocity;
  final String Temperature;
  final String period;
  final String Density;

  Planet_Modals({required this.name,required this.type,required this.image,required this.description,required this.data,required this.mass,required this.volume,required this.surface,required this.gravity,required this.escapevelocity,required this.Temperature,required this.period,required this.Density}){}

  factory Planet_Modals.fromMap({required Map Data}){
    return Planet_Modals(name: Data["name"], type:  Data["type"], image:  Data["image"], description:  Data["description"],data: Data["data"],mass: Data["mass"],volume: Data["volume"],surface: Data["surface"],gravity: Data["gravity"],escapevelocity: Data["escapevelocity"],Temperature: Data["Temperature"],period: Data["period"],Density: Data["Density"]);
  }

}