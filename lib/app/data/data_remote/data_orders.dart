
// ignore_for_file: non_constant_identifier_names

// ignore: camel_case_types
class Data_Orders{

  late int id_order;
  late int id_user_order;
  late String address_order;
  late String phone_order;
  late String date_order;
  late String namepickup_order;

  Data_Orders(this.id_order,this.id_user_order,this.address_order,this.phone_order,this.date_order,this.namepickup_order);

  Data_Orders.fromJson(Map<String, dynamic> json){
    id_order = json['id_order'];
    id_user_order = json['id_user_order'];
    address_order = json['address_order'];
    phone_order = json['phone_order'];
    date_order = json['date_order'];
    namepickup_order = json['namepickup_order'];
  }

}