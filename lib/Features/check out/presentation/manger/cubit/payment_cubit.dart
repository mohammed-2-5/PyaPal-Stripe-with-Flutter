import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/Features/check%20out/data/models/PaymentIntentInputModel.dart';
import 'package:payment/Features/check%20out/data/repo/check_out_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;
  Future<void> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
   var data= await checkOutRepo.makePayment(paymentIntentInputModel: paymentIntentInputModel);
   data.fold((l) => emit(PaymentFailure(l.errorMessage)), (r) =>emit(PaymentSuccess()));
  }

}
