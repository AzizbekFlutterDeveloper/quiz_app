
class QuizModel {
    QuizModel({
        this.id,
        this.savollar,
        this.javob,
        this.togri,
        this.img,
    });

    int? id;
    List<String>? savollar;
    List<String>? javob;
    String? togri;
    String? img;

    factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json["id"],
        savollar: List<String>.from(json["savollar"].map((x) => x)),
        javob: List<String>.from(json["javob"].map((x) => x)),
        togri: json["togri"],
        img: json["img"],
    );

    
}
