class Personal {
    String? species;
    String? status;
    String? kekkeiGenkai;
    String? classification;
    List<String>? titles;
    String? birthdate;
    String? sex;

    Personal({
        this.species,
        this.status,
        this.kekkeiGenkai,
        this.classification,
        this.titles,
        this.birthdate,
        this.sex,
    });

    factory Personal.fromJson(Map<String, dynamic> json) => Personal(
        species: json["species"] !=null ? json["species"] : null,
        status: json["status"]!=null? json["status"]: null,
        kekkeiGenkai: json["kekkei_genkai"]!=null? json["kekkei_genkai"]: null,
        classification: json["classification"]!=null? json["classification"]: null,
        titles: json["titles"] != null ?  List<String>.from(json["titles"].map((x) => x)): null,
        birthdate: json["birthdate"]!=null? json["birthdate"]: null,
        sex: json["sex"]!=null? json["sex"]: null,
    );

    Map<String, dynamic> toJson() => {
        "species": species,
        "status": status,
        "kekkei_genkai": kekkeiGenkai,
        "classification": classification,
        "titles": titles,
        "birthdate": birthdate,
        "sex": sex,
    };
}

