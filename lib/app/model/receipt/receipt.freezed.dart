// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Receipt {
  String get receiptId;
  String get orderId;
  int get price;
  int get taxFree;
  int get cancelledPrice;
  int get cancelledTaxFree;
  String get orderName;
  String get companyName;
  bool get sandbox;
  String get pg;
  String get method;
  String get methodOriginSymbol;
  @DateTimeConverter()
  DateTime get purchasedAt;
  @DateTimeConverter()
  DateTime get requestedAt;
  String get statusLocale;
  String get currency;
  String get receiptUrl;
  int get status;
  @CardDataConverter()
  CardData get cardData;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceiptCopyWith<Receipt> get copyWith =>
      _$ReceiptCopyWithImpl<Receipt>(this as Receipt, _$identity);

  /// Serializes this Receipt to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Receipt &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.taxFree, taxFree) || other.taxFree == taxFree) &&
            (identical(other.cancelledPrice, cancelledPrice) ||
                other.cancelledPrice == cancelledPrice) &&
            (identical(other.cancelledTaxFree, cancelledTaxFree) ||
                other.cancelledTaxFree == cancelledTaxFree) &&
            (identical(other.orderName, orderName) ||
                other.orderName == orderName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.sandbox, sandbox) || other.sandbox == sandbox) &&
            (identical(other.pg, pg) || other.pg == pg) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.methodOriginSymbol, methodOriginSymbol) ||
                other.methodOriginSymbol == methodOriginSymbol) &&
            (identical(other.purchasedAt, purchasedAt) ||
                other.purchasedAt == purchasedAt) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(other.statusLocale, statusLocale) ||
                other.statusLocale == statusLocale) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cardData, cardData) ||
                other.cardData == cardData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        receiptId,
        orderId,
        price,
        taxFree,
        cancelledPrice,
        cancelledTaxFree,
        orderName,
        companyName,
        sandbox,
        pg,
        method,
        methodOriginSymbol,
        purchasedAt,
        requestedAt,
        statusLocale,
        currency,
        receiptUrl,
        status,
        cardData
      ]);

  @override
  String toString() {
    return 'Receipt(receiptId: $receiptId, orderId: $orderId, price: $price, taxFree: $taxFree, cancelledPrice: $cancelledPrice, cancelledTaxFree: $cancelledTaxFree, orderName: $orderName, companyName: $companyName, sandbox: $sandbox, pg: $pg, method: $method, methodOriginSymbol: $methodOriginSymbol, purchasedAt: $purchasedAt, requestedAt: $requestedAt, statusLocale: $statusLocale, currency: $currency, receiptUrl: $receiptUrl, status: $status, cardData: $cardData)';
  }
}

/// @nodoc
abstract mixin class $ReceiptCopyWith<$Res> {
  factory $ReceiptCopyWith(Receipt value, $Res Function(Receipt) _then) =
      _$ReceiptCopyWithImpl;
  @useResult
  $Res call(
      {String receiptId,
      String orderId,
      int price,
      int taxFree,
      int cancelledPrice,
      int cancelledTaxFree,
      String orderName,
      String companyName,
      bool sandbox,
      String pg,
      String method,
      String methodOriginSymbol,
      @DateTimeConverter() DateTime purchasedAt,
      @DateTimeConverter() DateTime requestedAt,
      String statusLocale,
      String currency,
      String receiptUrl,
      int status,
      @CardDataConverter() CardData cardData});

  $CardDataCopyWith<$Res> get cardData;
}

/// @nodoc
class _$ReceiptCopyWithImpl<$Res> implements $ReceiptCopyWith<$Res> {
  _$ReceiptCopyWithImpl(this._self, this._then);

  final Receipt _self;
  final $Res Function(Receipt) _then;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiptId = null,
    Object? orderId = null,
    Object? price = null,
    Object? taxFree = null,
    Object? cancelledPrice = null,
    Object? cancelledTaxFree = null,
    Object? orderName = null,
    Object? companyName = null,
    Object? sandbox = null,
    Object? pg = null,
    Object? method = null,
    Object? methodOriginSymbol = null,
    Object? purchasedAt = null,
    Object? requestedAt = null,
    Object? statusLocale = null,
    Object? currency = null,
    Object? receiptUrl = null,
    Object? status = null,
    Object? cardData = null,
  }) {
    return _then(_self.copyWith(
      receiptId: null == receiptId
          ? _self.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      taxFree: null == taxFree
          ? _self.taxFree
          : taxFree // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledPrice: null == cancelledPrice
          ? _self.cancelledPrice
          : cancelledPrice // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledTaxFree: null == cancelledTaxFree
          ? _self.cancelledTaxFree
          : cancelledTaxFree // ignore: cast_nullable_to_non_nullable
              as int,
      orderName: null == orderName
          ? _self.orderName
          : orderName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      sandbox: null == sandbox
          ? _self.sandbox
          : sandbox // ignore: cast_nullable_to_non_nullable
              as bool,
      pg: null == pg
          ? _self.pg
          : pg // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      methodOriginSymbol: null == methodOriginSymbol
          ? _self.methodOriginSymbol
          : methodOriginSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      purchasedAt: null == purchasedAt
          ? _self.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestedAt: null == requestedAt
          ? _self.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statusLocale: null == statusLocale
          ? _self.statusLocale
          : statusLocale // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      receiptUrl: null == receiptUrl
          ? _self.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      cardData: null == cardData
          ? _self.cardData
          : cardData // ignore: cast_nullable_to_non_nullable
              as CardData,
    ));
  }

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardDataCopyWith<$Res> get cardData {
    return $CardDataCopyWith<$Res>(_self.cardData, (value) {
      return _then(_self.copyWith(cardData: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Receipt implements Receipt {
  const _Receipt(
      {required this.receiptId,
      required this.orderId,
      required this.price,
      required this.taxFree,
      required this.cancelledPrice,
      required this.cancelledTaxFree,
      required this.orderName,
      required this.companyName,
      required this.sandbox,
      required this.pg,
      required this.method,
      required this.methodOriginSymbol,
      @DateTimeConverter() required this.purchasedAt,
      @DateTimeConverter() required this.requestedAt,
      required this.statusLocale,
      required this.currency,
      required this.receiptUrl,
      required this.status,
      @CardDataConverter() required this.cardData});
  factory _Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  @override
  final String receiptId;
  @override
  final String orderId;
  @override
  final int price;
  @override
  final int taxFree;
  @override
  final int cancelledPrice;
  @override
  final int cancelledTaxFree;
  @override
  final String orderName;
  @override
  final String companyName;
  @override
  final bool sandbox;
  @override
  final String pg;
  @override
  final String method;
  @override
  final String methodOriginSymbol;
  @override
  @DateTimeConverter()
  final DateTime purchasedAt;
  @override
  @DateTimeConverter()
  final DateTime requestedAt;
  @override
  final String statusLocale;
  @override
  final String currency;
  @override
  final String receiptUrl;
  @override
  final int status;
  @override
  @CardDataConverter()
  final CardData cardData;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReceiptCopyWith<_Receipt> get copyWith =>
      __$ReceiptCopyWithImpl<_Receipt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReceiptToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Receipt &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.taxFree, taxFree) || other.taxFree == taxFree) &&
            (identical(other.cancelledPrice, cancelledPrice) ||
                other.cancelledPrice == cancelledPrice) &&
            (identical(other.cancelledTaxFree, cancelledTaxFree) ||
                other.cancelledTaxFree == cancelledTaxFree) &&
            (identical(other.orderName, orderName) ||
                other.orderName == orderName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.sandbox, sandbox) || other.sandbox == sandbox) &&
            (identical(other.pg, pg) || other.pg == pg) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.methodOriginSymbol, methodOriginSymbol) ||
                other.methodOriginSymbol == methodOriginSymbol) &&
            (identical(other.purchasedAt, purchasedAt) ||
                other.purchasedAt == purchasedAt) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(other.statusLocale, statusLocale) ||
                other.statusLocale == statusLocale) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cardData, cardData) ||
                other.cardData == cardData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        receiptId,
        orderId,
        price,
        taxFree,
        cancelledPrice,
        cancelledTaxFree,
        orderName,
        companyName,
        sandbox,
        pg,
        method,
        methodOriginSymbol,
        purchasedAt,
        requestedAt,
        statusLocale,
        currency,
        receiptUrl,
        status,
        cardData
      ]);

  @override
  String toString() {
    return 'Receipt(receiptId: $receiptId, orderId: $orderId, price: $price, taxFree: $taxFree, cancelledPrice: $cancelledPrice, cancelledTaxFree: $cancelledTaxFree, orderName: $orderName, companyName: $companyName, sandbox: $sandbox, pg: $pg, method: $method, methodOriginSymbol: $methodOriginSymbol, purchasedAt: $purchasedAt, requestedAt: $requestedAt, statusLocale: $statusLocale, currency: $currency, receiptUrl: $receiptUrl, status: $status, cardData: $cardData)';
  }
}

/// @nodoc
abstract mixin class _$ReceiptCopyWith<$Res> implements $ReceiptCopyWith<$Res> {
  factory _$ReceiptCopyWith(_Receipt value, $Res Function(_Receipt) _then) =
      __$ReceiptCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String receiptId,
      String orderId,
      int price,
      int taxFree,
      int cancelledPrice,
      int cancelledTaxFree,
      String orderName,
      String companyName,
      bool sandbox,
      String pg,
      String method,
      String methodOriginSymbol,
      @DateTimeConverter() DateTime purchasedAt,
      @DateTimeConverter() DateTime requestedAt,
      String statusLocale,
      String currency,
      String receiptUrl,
      int status,
      @CardDataConverter() CardData cardData});

  @override
  $CardDataCopyWith<$Res> get cardData;
}

/// @nodoc
class __$ReceiptCopyWithImpl<$Res> implements _$ReceiptCopyWith<$Res> {
  __$ReceiptCopyWithImpl(this._self, this._then);

  final _Receipt _self;
  final $Res Function(_Receipt) _then;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? receiptId = null,
    Object? orderId = null,
    Object? price = null,
    Object? taxFree = null,
    Object? cancelledPrice = null,
    Object? cancelledTaxFree = null,
    Object? orderName = null,
    Object? companyName = null,
    Object? sandbox = null,
    Object? pg = null,
    Object? method = null,
    Object? methodOriginSymbol = null,
    Object? purchasedAt = null,
    Object? requestedAt = null,
    Object? statusLocale = null,
    Object? currency = null,
    Object? receiptUrl = null,
    Object? status = null,
    Object? cardData = null,
  }) {
    return _then(_Receipt(
      receiptId: null == receiptId
          ? _self.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      taxFree: null == taxFree
          ? _self.taxFree
          : taxFree // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledPrice: null == cancelledPrice
          ? _self.cancelledPrice
          : cancelledPrice // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledTaxFree: null == cancelledTaxFree
          ? _self.cancelledTaxFree
          : cancelledTaxFree // ignore: cast_nullable_to_non_nullable
              as int,
      orderName: null == orderName
          ? _self.orderName
          : orderName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      sandbox: null == sandbox
          ? _self.sandbox
          : sandbox // ignore: cast_nullable_to_non_nullable
              as bool,
      pg: null == pg
          ? _self.pg
          : pg // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      methodOriginSymbol: null == methodOriginSymbol
          ? _self.methodOriginSymbol
          : methodOriginSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      purchasedAt: null == purchasedAt
          ? _self.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestedAt: null == requestedAt
          ? _self.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statusLocale: null == statusLocale
          ? _self.statusLocale
          : statusLocale // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      receiptUrl: null == receiptUrl
          ? _self.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      cardData: null == cardData
          ? _self.cardData
          : cardData // ignore: cast_nullable_to_non_nullable
              as CardData,
    ));
  }

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardDataCopyWith<$Res> get cardData {
    return $CardDataCopyWith<$Res>(_self.cardData, (value) {
      return _then(_self.copyWith(cardData: value));
    });
  }
}

// dart format on
