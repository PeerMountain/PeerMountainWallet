import 'package:kyc3/generated/com/kyc3/exchange.pb.dart';
import 'package:kyc3/models/crypto/user_crypto_account.dart';

/// Will only be used when user is logged into app
/// otherwise will make sure that its not used before anywhere.
///
/// It holds all of the credentials related to currently logged in user.
late CryptoAccount cryptoAccount;

/// Will only be used when user is logged into app and
/// we have verified server address.
/// otherwise will make sure that its not used before anywhere.
late ExchangeKeysResponse serverAccount;
