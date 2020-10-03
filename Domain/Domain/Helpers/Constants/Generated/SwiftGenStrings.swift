// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Error {
    public enum Message {
      /// Campo obrigatório.
      public static let requiment = L10n.tr("Localizable", "Error.Message.requiment")
      public enum Username {
        /// Usuário inválido: múltiplas palavras
        public static let multipleWords = L10n.tr("Localizable", "Error.Message.Username.multipleWords")
      }
    }
    public enum Title {
      /// Ops!
      public static let ops = L10n.tr("Localizable", "Error.Title.ops")
    }
  }

  public enum Symbol {
    /// pt_BR
    public static let locale = L10n.tr("Localizable", "Symbol.locale")
  }

  public enum Twitter {
    public enum Date {
      /// EEE MMM dd HH:mm:ss Z yyyy
      public static let format = L10n.tr("Localizable", "Twitter.Date.format")
      /// en_US_POSIX
      public static let locale = L10n.tr("Localizable", "Twitter.Date.locale")
    }
  }

  public enum User {
    public enum ProfileImageUrl {
      /// https://pbs.twimg.com/profile_images/473550724433858560/tuHsaI2U_normal.png
      public static let sample = L10n.tr("Localizable", "User.ProfileImageUrl.sample")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
