/// All the strings that are being used throughout the app.
class Strings {
  Strings._();
  static const String ribnSupportDescriptionHint =
      "Write 50-500 characters about your experience, whether it was great or has room for improvement. You can also report technical bugs or request new features.";

  static const String useToplMainKey = 'USE TOPL MAIN KEY';
  static const String advancedOption = 'Advanced option';
  static const String amount = 'Amount';
  static const String amountHint = '250,000';
  static const String mint = 'Mint';
  static const String writeDownSeedPhrase = 'Write Down Seed Phrase';
  static const String finalReview = 'FINAL REVIEW';
  static const String createWalletPassword = 'Create Wallet Password';
  static const String howIsMySeedPhraseUnrecoverable =
      'How is my Seed Phrase or Wallet Password unrecoverable?';
  static const String howIsMySeedPhraseUnrecoverableNewLine =
      '''You are the only one with a record of your Seed Phrase or Wallet Password.\nTopl does not maintain or have any way to generate either of these for you.''';
  static const String howIsMySeedPhraseUnrecoverableMultipleLines =
      '''You are the only one with a record of your Seed Phrase\nor Wallet Password. Topl does not maintain or have any\nway to generate either of these for you.''';
  static const String generateSeedPhrase = 'GENERATE SEED PHRASE';
  static const String confirmSeedPhrase = 'CONFIRM SEED PHRASE';
  static const String assetCodeShortInfo =
      'This is used to view the short name for your \nasset as this will be the information used to\nidentify a particular asset on the blockchain.';
  static const String refillCurrentPolyBalance =
      'You can refill your Poly balance anytime by\n signing into';
  static const String to = 'To';
  static const String yourRibnWalletAddress = 'Your Ribn Wallet address';
  static const String assetTransferToHint = 'Paste Recipient’s address.';
  static const String assetShortName = 'Asset code • short';
  static const String assetShortNameHint = 'YLW JACK2, max 8 characters.';
  static const String assetLongNameInfo =
      'The descriptive name used to identify your\nassets locally in your Ribn Wallet.';
  static const String assetLongName = 'Asset';
  static const String assetLongNameHint = 'Jackfruit, max 16 characters.';
  static const String note = 'Note';
  static const String noteHint = 'Max 127 alpha numeric characters. No special characters';
  static const String gettingStarted = 'Getting Started';
  static const String mintAssetDesc = 'Where would you like your Asset to be minted?';
  static const String invalidAmountError =
      'The amount you entered exceeds\nyour wallet balance for this asset.\nPlease enter a valid amount!';
  static const String errorTitle = 'Oops!\nSomething went wrong';
  static const String errorDescription =
      '''Ribn failed to reach the internet. This could be related to wifi connectivity or network issues.\n\nCheck your internet connection and try again, or contact the Ribn support team.''';
  static const String contactSupport = 'Contact Support';
  static const String tryAgain = 'Try Again';
  static const String supportEmail = 'support@topl.me';
  static const String transactionDetails = 'Activity details';
  static const String supportEmailLink = 'mailto:$supportEmail?subject=Ribn Support&body=';
  static const String invalidRecipientAddressError =
      "Hmmm... That's not a valid Recipient address.\nTip: Instead of typing it out, try copy\nand pasting your Recipient's address.";
  static const String connectDApp = 'allowing this site to see my Ribn address, and ';
  static const String connectDAppLastPart = "suggest transactions to approve.";
}
