import 'package:dartz/dartz.dart';
import 'package:payment/Core/errors/Failure.dart';
import 'package:payment/Core/services/Stripe_Services.dart';
import 'package:payment/Features/check%20out/data/models/PaymentIntentInputModel.dart';
import 'package:payment/Features/check%20out/data/repo/check_out_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo{
  final StripeServices stripeServices=StripeServices();
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{

    try {
      await stripeServices.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

}