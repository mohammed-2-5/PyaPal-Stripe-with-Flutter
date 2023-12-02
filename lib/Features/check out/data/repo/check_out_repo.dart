import 'package:dartz/dartz.dart';
import 'package:payment/Features/check%20out/data/models/PaymentIntentInputModel.dart';

import '../../../../Core/errors/Failure.dart';

abstract class CheckOutRepo{
  Future<Either<Failure,void>>makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}

