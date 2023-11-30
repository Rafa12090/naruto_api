class Debut {
    String? novel;
    String? movie;
    String? appearsIn;
    String? manga;
    String? anime;
    String? game;
    String? ova;

    Debut({
        this.novel,
        this.movie,
        this.appearsIn,
        this.manga,
        this.anime,
        this.game,
        this.ova,
    });

    factory Debut.fromJson(Map<String, dynamic> json) => Debut(
        novel: json["novel"] != null ? json["novel"] : null,
        movie: json["movie"] != null ? json["movie"] : null,
        appearsIn: json["appearsIn"] != null ? json["appearsIn"] : null,
        manga: json["manga"]!= null? json["manga"]: null,
        anime: json["anime"]!= null? json["anime"]: null,
        game: json["game"]!= null? json["game"]: null,
        ova: json["ova"]!= null? json["ova"]: null,
    );

    Map<String, dynamic> toJson() => {
        "novel": novel,
        "movie": movie,
        "appearsIn": appearsIn,
        "manga": manga,
        "anime": anime,
        "game": game,
        "ova": ova,
    };
}
