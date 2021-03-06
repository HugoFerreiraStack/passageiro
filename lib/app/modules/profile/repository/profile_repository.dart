// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:passageiro/app/modules/profile/repository/profile_interface.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';

class ProfileRepository implements ProfileInterface {
  @override
  Future<Either<String, Passageiro?>> getUserData(String id) async {
    late Passageiro user;
    try {
      await FirebaseFirestore.instance
          .collection('passageiros')
          .doc(id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print('Encontrou');
          final data = documentSnapshot.data() as Map<String, dynamic>;
          log(data.toString());
          user = Passageiro.fromJson(data);
          return Right(user);
        }
      });
    } catch (e) {
      print(e.toString());
      return Left('Erro ao recuperar dados');
    }
    return Right(user);
  }
}
