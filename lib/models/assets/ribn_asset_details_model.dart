import 'dart:convert';

import '../../constants/assets.dart';

/// User defined asset details.
class RibnAssetDetails {
  /// The long name assigned to the asset.
  final String? longName;

  /// The custom icon assigned to the asset; see [UIConstants.assetIconsList]
  final String? icon;

  /// The cusotm unit that's assigned to the asset; see [UIConstants.assetUnitsList].
  final String? unit;

  RibnAssetDetails({
    this.longName,
    this.icon,
    this.unit,
  });

  RibnAssetDetails copyWith({
    String? longName,
    String? icon,
    String? unit,
  }) {
    return RibnAssetDetails(
      longName: longName ?? this.longName,
      icon: icon ?? this.icon,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'longName': longName,
      'icon': icon,
      'unit': unit,
    };
  }

  factory RibnAssetDetails.fromMap(Map<String, dynamic> map) {
    return RibnAssetDetails(
      longName: map['longName'] ?? "Unknown",
      icon: map['icon'] ?? RibnAssets.undefinedIcon,
      unit: map['unit'] ?? "Unknown",
    );
  }

  String toJson() => json.encode(toMap());

  factory RibnAssetDetails.fromJson(String source) =>
      RibnAssetDetails.fromMap(json.decode(source));

  @override
  String toString() =>
      'RibnAssetDetails(longName: $longName, icon: $icon, unit: $unit)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RibnAssetDetails &&
        other.longName == longName &&
        other.icon == icon &&
        other.unit == unit;
  }

  @override
  int get hashCode => longName.hashCode ^ icon.hashCode ^ unit.hashCode;
}
