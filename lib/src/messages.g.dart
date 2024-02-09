// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

class SaveFileMessage {
  SaveFileMessage({
    required this.filename,
    required this.content,
  });

  String filename;

  String content;

  Object encode() {
    return <Object?>[
      filename,
      content,
    ];
  }

  static SaveFileMessage decode(Object result) {
    result as List<Object?>;
    return SaveFileMessage(
      filename: result[0]! as String,
      content: result[1]! as String,
    );
  }
}

class ReadFileMessage {
  ReadFileMessage({
    required this.filename,
  });

  String filename;

  Object encode() {
    return <Object?>[
      filename,
    ];
  }

  static ReadFileMessage decode(Object result) {
    result as List<Object?>;
    return ReadFileMessage(
      filename: result[0]! as String,
    );
  }
}

class FileResponse {
  FileResponse({
    required this.successful,
    this.content,
    this.error,
  });

  bool successful;

  String? content;

  String? error;

  Object encode() {
    return <Object?>[
      successful,
      content,
      error,
    ];
  }

  static FileResponse decode(Object result) {
    result as List<Object?>;
    return FileResponse(
      successful: result[0]! as bool,
      content: result[1] as String?,
      error: result[2] as String?,
    );
  }
}

class _DeviceFileApiCodec extends StandardMessageCodec {
  const _DeviceFileApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is FileResponse) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is ReadFileMessage) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is SaveFileMessage) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return FileResponse.decode(readValue(buffer)!);
      case 129: 
        return ReadFileMessage.decode(readValue(buffer)!);
      case 130: 
        return SaveFileMessage.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class DeviceFileApi {
  /// Constructor for [DeviceFileApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  DeviceFileApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _DeviceFileApiCodec();

  Future<FileResponse> saveFile(SaveFileMessage msg) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.save_content_as_txt_file.DeviceFileApi.saveFile';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[msg]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as FileResponse?)!;
    }
  }

  Future<FileResponse> readFile(ReadFileMessage msg) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.save_content_as_txt_file.DeviceFileApi.readFile';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[msg]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as FileResponse?)!;
    }
  }
}

class _FlutterFileApiCodec extends StandardMessageCodec {
  const _FlutterFileApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is FileResponse) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return FileResponse.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class FlutterFileApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _FlutterFileApiCodec();

  void displayContent(FileResponse response);

  static void setup(FlutterFileApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.save_content_as_txt_file.FlutterFileApi.displayContent', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.save_content_as_txt_file.FlutterFileApi.displayContent was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final FileResponse? arg_response = (args[0] as FileResponse?);
          assert(arg_response != null,
              'Argument for dev.flutter.pigeon.save_content_as_txt_file.FlutterFileApi.displayContent was null, expected non-null FileResponse.');
          try {
            api.displayContent(arg_response!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
