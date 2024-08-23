import 'dart:convert';

UsDataResModel usDataResModelFromJson(String str) =>
    UsDataResModel.fromJson(json.decode(str));

class UsDataResModel {
  List<UsDataModel>? usDataList;
  List<Source>? source;

  UsDataResModel({
    this.usDataList,
    this.source,
  });

  factory UsDataResModel.fromJson(Map<String, dynamic> json) => UsDataResModel(
        usDataList: json["data"] == null
            ? []
            : List<UsDataModel>.from(
                json["data"]!.map((x) => UsDataModel.fromJson(x))),
        source: json["source"] == null
            ? []
            : List<Source>.from(json["source"]!.map((x) => Source.fromJson(x))),
      );
}

class UsDataModel {
  String? idNation;
  String? nation;
  num? idYear;
  String? year;
  num? population;
  String? slugNation;

  UsDataModel({
    this.idNation,
    this.nation,
    this.idYear,
    this.year,
    this.population,
    this.slugNation,
  });

  factory UsDataModel.fromJson(Map<String, dynamic> json) => UsDataModel(
        idNation: json["ID Nation"],
        nation: json["Nation"],
        idYear: json["ID Year"],
        year: json["Year"],
        population: json["Population"],
        slugNation: json["Slug Nation"],
      );
}

class Source {
  List<String>? measures;
  Annotations? annotations;
  String? name;
  List<dynamic>? substitutions;

  Source({
    this.measures,
    this.annotations,
    this.name,
    this.substitutions,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        measures: json["measures"] == null
            ? []
            : List<String>.from(json["measures"]!.map((x) => x)),
        annotations: json["annotations"] == null
            ? null
            : Annotations.fromJson(json["annotations"]),
        name: json["name"],
        substitutions: json["substitutions"] == null
            ? []
            : List<dynamic>.from(json["substitutions"]!.map((x) => x)),
      );
}

class Annotations {
  String? sourceName;
  String? sourceDescription;
  String? datasetName;
  String? datasetLink;
  String? tableId;
  String? topic;
  String? subtopic;

  Annotations({
    this.sourceName,
    this.sourceDescription,
    this.datasetName,
    this.datasetLink,
    this.tableId,
    this.topic,
    this.subtopic,
  });

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        sourceName: json["source_name"],
        sourceDescription: json["source_description"],
        datasetName: json["dataset_name"],
        datasetLink: json["dataset_link"],
        tableId: json["table_id"],
        topic: json["topic"],
        subtopic: json["subtopic"],
      );
}
