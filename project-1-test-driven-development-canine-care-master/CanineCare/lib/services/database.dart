import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

    final String uid;
    DatabaseService({this.uid});
  // collection reference
  final CollectionReference dogCollection = Firestore.instance.collection('dogInfo');

  Future updateUserData(String name, double weight, double age) async {
    return await dogCollection.document(uid).setData({
      'name': name,
      'weight': weight,
      'age': age,
    });
  }

  // get dogInfo stream
  Stream<QuerySnapshot> get dogInfo {
    return dogCollection.snapshots();
  }
}