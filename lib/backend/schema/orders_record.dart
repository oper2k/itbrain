import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "client_email" field.
  String? _clientEmail;
  String get clientEmail => _clientEmail ?? '';
  bool hasClientEmail() => _clientEmail != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "purchased_product" field.
  String? _purchasedProduct;
  String get purchasedProduct => _purchasedProduct ?? '';
  bool hasPurchasedProduct() => _purchasedProduct != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "client_phone" field.
  String? _clientPhone;
  String get clientPhone => _clientPhone ?? '';
  bool hasClientPhone() => _clientPhone != null;

  void _initializeFields() {
    _clientEmail = snapshotData['client_email'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _purchasedProduct = snapshotData['purchased_product'] as String?;
    _orderId = snapshotData['order_id'] as String?;
    _status = snapshotData['status'] as String?;
    _clientPhone = snapshotData['client_phone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? clientEmail,
  DateTime? createdAt,
  String? purchasedProduct,
  String? orderId,
  String? status,
  String? clientPhone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'client_email': clientEmail,
      'created_at': createdAt,
      'purchased_product': purchasedProduct,
      'order_id': orderId,
      'status': status,
      'client_phone': clientPhone,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.clientEmail == e2?.clientEmail &&
        e1?.createdAt == e2?.createdAt &&
        e1?.purchasedProduct == e2?.purchasedProduct &&
        e1?.orderId == e2?.orderId &&
        e1?.status == e2?.status &&
        e1?.clientPhone == e2?.clientPhone;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.clientEmail,
        e?.createdAt,
        e?.purchasedProduct,
        e?.orderId,
        e?.status,
        e?.clientPhone
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
