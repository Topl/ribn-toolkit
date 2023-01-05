class Rules {
  Rules._();
  static const networkRegistry = <String, int>{
    'toplnet': 0x01,
    'valhalla': 0x10,
    'private': 0x40
  };

  static Map<int, String> txHistoryUrls = {
    0x01: 'https://annulus-api.topl.services/staging/valhalla',
    0x10: 'https://annulus-api.topl.services/staging/toplnet',
    0x40: 'https://annulus-api.topl.services/staging/valhalla',
  };
  static Map<int, String> txDetailsRedirectUrls = {
    0x01: 'https://staging.valhalla.annulus.topl.services/#/transaction/',
    0x10: 'https://staging.toplnet.annulus.topl.services/#/transaction/',
    0x40: 'https://staging.valhalla.annulus.topl.services/#/transaction/',
  };
}

enum TransferType {
  polyTransfer,
  assetTransfer,
  mintingAsset,
  remintingAsset,
}

enum AppViews {
  extension, // app opened in the usual extension window
  extensionTab, // extension has a dedicated tab/window open, e.g. during onboarding or dApp interaction
  mobile, // app opened on mobile
  webDebug, // app opened in debug mode on web
}
