class NotificationModel {
  int? notificationId;
  int? notificationUserid;
  String? notificationMessage;
  String? notificationTitle;
  String? notificationDate;

  NotificationModel({
    this.notificationId,
    this.notificationUserid,
    this.notificationMessage,
    this.notificationTitle,
    this.notificationDate,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationUserid = json['notification_userid'];
    notificationTitle = json['notification_title'];
    notificationMessage = json['notification_message'];
    notificationDate = json['notification_date'];
  }
}
