// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
public typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum FontFamily {
  public enum Rubik {
    public static let bold = FontConvertible(name: "Rubik-Bold", family: "Rubik", path: "Rubik-Bold.ttf")
    public static let boldItalic = FontConvertible(name: "Rubik-BoldItalic", family: "Rubik", path: "Rubik-BoldItalic.ttf")
    public static let italic = FontConvertible(name: "Rubik-Italic", family: "Rubik", path: "Rubik-Italic.ttf")
    public static let regular = FontConvertible(name: "Rubik-Regular", family: "Rubik", path: "Rubik-Regular.ttf")
    public static let all: [FontConvertible] = [bold, boldItalic, italic, regular]
  }
  public enum RubikBlack {
    public static let regular = FontConvertible(name: "Rubik-Black", family: "Rubik Black", path: "Rubik-Black.ttf")
    public static let italic = FontConvertible(name: "Rubik-BlackItalic", family: "Rubik Black", path: "Rubik-BlackItalic.ttf")
    public static let all: [FontConvertible] = [regular, italic]
  }
  public enum RubikLight {
    public static let regular = FontConvertible(name: "Rubik-Light", family: "Rubik Light", path: "Rubik-Light.ttf")
    public static let italic = FontConvertible(name: "Rubik-LightItalic", family: "Rubik Light", path: "Rubik-LightItalic.ttf")
    public static let all: [FontConvertible] = [regular, italic]
  }
  public enum RubikMedium {
    public static let regular = FontConvertible(name: "Rubik-Medium", family: "Rubik Medium", path: "Rubik-Medium.ttf")
    public static let italic = FontConvertible(name: "Rubik-MediumItalic", family: "Rubik Medium", path: "Rubik-MediumItalic.ttf")
    public static let all: [FontConvertible] = [regular, italic]
  }
  public static let allCustomFonts: [FontConvertible] = [Rubik.all, RubikBlack.all, RubikLight.all, RubikMedium.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct FontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(OSX)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

public extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
