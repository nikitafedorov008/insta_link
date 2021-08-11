/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String name;
  String email;
  String phone;
  String comment;
  String dateFrom;
  String dateTo;

  FeedbackForm(this.name, this.email, this.phone, this.comment, this.dateFrom, this.dateTo);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['name']}",
        "${json['email']}",
        "${json['phone']}",
        "${json['comment']}",
        "${json['dateFrom']}",
        "${json['dateTo']}"
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'comment': comment,
    'dateFrom': dateFrom,
    'dateTo': dateTo
  };
}