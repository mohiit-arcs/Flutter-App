import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfo);
  }

  updateUserWallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'Wallet': amount});
  }

  Future addFoodItem(Map<String, dynamic> addFoodInfo, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(addFoodInfo);
  }
}
