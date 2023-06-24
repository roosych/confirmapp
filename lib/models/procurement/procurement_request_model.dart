class ProcurementRequest {
  final int id;
  final String step;
  final String type;
  final int requestNumber;
  final int materialCode;
  final String materialTitle;
  final int quantity;
  final String unit;
  final String date;
  final String owner;
  final String department;
  final String creator;
  final String note;

  ProcurementRequest(
      this.id,
      this.step,
      this.type,
      this.requestNumber,
      this.materialCode,
      this.materialTitle,
      this.quantity,
      this.unit,
      this.date,
      this.owner,
      this.department,
      this.creator,
      this.note);
}

      // 'id': 2,
      // 'step': 'Rəhbərlik',
      // 'type': 'Cari qulluq və avadanlıq təmiri',
      // 'number': '032548',
      // 'material_code': '45876',
      // 'material_title': 'Kartric',
      // 'quantity': 1,
      // 'unit': 'ƏD',
      // 'date': '02.03.2023',
      // 'owner': 'Sergey Yejov',
      // 'dept': 'İnformasiya Texnoloqiyaları Departamenti',
      // 'creator': 'Seymur Şirinov',
      // 'note': 'Canon printeri üçün kartric dəsti',