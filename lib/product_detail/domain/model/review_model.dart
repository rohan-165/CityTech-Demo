class ReviewModel {
  String? name;
  String? comment;
  String? rating;
  String? date;
  ReviewModel({
    this.name,
    this.comment,
    this.rating,
    this.date,
  });

  ReviewModel copyWith({
    String? name,
    String? comment,
    String? rating,
    String? date,
  }) {
    return ReviewModel(
      name: name ?? this.name,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'comment': comment,
      'rating': rating,
      'date': date,
    };
  }

  ReviewModel.fromMap(Map<String, dynamic> map) {
    name = map['name'] != null ? map['name'] as String : null;
    comment = map['comment'] != null ? map['comment'] as String : null;
    rating = map['rating'] != null ? map['rating'] as String : null;
    date = map['date'] != null ? map['date'] as String : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['comment'] = comment;
    data['rating'] = rating;
    data['date'] = date;
    return data;
  }
}
