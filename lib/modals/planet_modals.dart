class Planet_Modals{

  final String name;
  final String type;
  final String image;
  final String description;

  Planet_Modals({required this.name,required this.type,required this.image,required this.description}){}

  factory Planet_Modals.fromMap({required Map data}){
    return Planet_Modals(name: data["name"], type:  data["type"], image:  data["image"], description:  data["description"]);
  }

}