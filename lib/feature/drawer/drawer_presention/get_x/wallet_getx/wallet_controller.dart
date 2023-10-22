import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/wallet.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/get_wallet_usecase.dart';

class WalletController extends GetxController {
  GetWalletUseCase getWalletUseCase;
  WalletController({required this.getWalletUseCase});
  @override
  onInit() {
    super.onInit();
    getWallet();
  }
List<Wallet> wallet =[];
  String walletUser = '';
  getWallet() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    walletUser = '${sharedPreferences.getString('wallet')}';


  var respponse= await    getWalletUseCase(userId: walletUser);
   respponse.fold((l) => Failure, (r) => wallet.addAll(r));
    update();
  }
}
