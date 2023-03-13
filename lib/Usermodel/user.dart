import 'package:get_api_call/Usermodel/address.dart';
import 'company.dart';

class User{
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Address? address;
  Company? company;

  User.fromJson(dynamic json){
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    address = Address.fromJson(json['address']);
    company = Company.fromJson(json['company']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id \n $name \n $username \n $email \n $phone \n $website \n $address \n $company";
  }
}