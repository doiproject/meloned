import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'member_record.g.dart';

abstract class MemberRecord
    implements Built<MemberRecord, MemberRecordBuilder> {
  static Serializer<MemberRecord> get serializer => _$memberRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get username;

  @nullable
  String get password;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MemberRecordBuilder builder) => builder
    ..email = ''
    ..username = ''
    ..password = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('member');

  static Stream<MemberRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MemberRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MemberRecord._();
  factory MemberRecord([void Function(MemberRecordBuilder) updates]) =
      _$MemberRecord;

  static MemberRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMemberRecordData({
  String email,
  String username,
  String password,
}) =>
    serializers.toFirestore(
        MemberRecord.serializer,
        MemberRecord((m) => m
          ..email = email
          ..username = username
          ..password = password));
