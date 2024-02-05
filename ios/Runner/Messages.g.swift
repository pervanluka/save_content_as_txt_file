// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct FileMessage {
  var text: String
  var content: String

  static func fromList(_ list: [Any?]) -> FileMessage? {
    let text = list[0] as! String
    let content = list[1] as! String

    return FileMessage(
      text: text,
      content: content
    )
  }
  func toList() -> [Any?] {
    return [
      text,
      content,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct Response {
  var successful: Bool
  var error: String? = nil

  static func fromList(_ list: [Any?]) -> Response? {
    let successful = list[0] as! Bool
    let error: String? = nilOrValue(list[1])

    return Response(
      successful: successful,
      error: error
    )
  }
  func toList() -> [Any?] {
    return [
      successful,
      error,
    ]
  }
}

private class DeviceFileApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return FileMessage.fromList(self.readValue() as! [Any?])
    case 129:
      return Response.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class DeviceFileApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? FileMessage {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? Response {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class DeviceFileApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return DeviceFileApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return DeviceFileApiCodecWriter(data: data)
  }
}

class DeviceFileApiCodec: FlutterStandardMessageCodec {
  static let shared = DeviceFileApiCodec(readerWriter: DeviceFileApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol DeviceFileApi {
  func saveFile(msg: FileMessage, completion: @escaping (Result<Response, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class DeviceFileApiSetup {
  /// The codec used by DeviceFileApi.
  static var codec: FlutterStandardMessageCodec { DeviceFileApiCodec.shared }
  /// Sets up an instance of `DeviceFileApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: DeviceFileApi?) {
    let saveFileChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.save_content_as_txt_file.DeviceFileApi.saveFile", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      saveFileChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let msgArg = args[0] as! FileMessage
        api.saveFile(msg: msgArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      saveFileChannel.setMessageHandler(nil)
    }
  }
}
