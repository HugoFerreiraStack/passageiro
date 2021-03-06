import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:passageiro/app/modules/home/repository/home_interface.dart';
import 'package:passageiro/app/shared/models/corrida.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';
import 'package:uuid/uuid.dart';

class HomeRepository implements HomeInterface {
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

  @override
  Future<Either<String, Unit>> chamarTaxi(Corrida corrida) async {
    try {
      await FirebaseFirestore.instance
          .collection('corridas')
          .doc(corrida.id)
          .set(corrida.toJson());
      print('Chegou aqui');

      return const Right(unit);
    } catch (e) {
      return const Left('Erro ao chamar taxi');
    }
  }
}
