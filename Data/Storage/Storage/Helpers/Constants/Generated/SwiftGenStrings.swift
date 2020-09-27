// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Address {
    internal enum File {
      /// json
      internal static let `extension` = L10n.tr("Localizable", "Address.File.extension")
    }
  }

  internal enum Error {
    internal enum Descriction {
      /// Não foi possível recuperar o saldo da conta.
      internal static let balance = L10n.tr("Localizable", "Error.Descriction.balance")
      /// Não foi possível recuperar os dados via biometria.
      internal static let biometric = L10n.tr("Localizable", "Error.Descriction.biometric")
      /// Não foi possível recuperar seu CPF.
      internal static let cpf = L10n.tr("Localizable", "Error.Descriction.cpf")
      internal enum Localized {
        /// Não foi possível recuperar as mensagens.
        internal static let retrieving = L10n.tr("Localizable", "Error.Descriction.Localized.retrieving")
        /// Não foi possível salvar as mensagens.
        internal static let saving = L10n.tr("Localizable", "Error.Descriction.Localized.saving")
      }
      internal enum Token {
        /// Não foi possível salvar o token.
        internal static let retrieving = L10n.tr("Localizable", "Error.Descriction.Token.retrieving")
        /// Não foi possível recuperar o token.
        internal static let saving = L10n.tr("Localizable", "Error.Descriction.Token.saving")
      }
    }
  }

  internal enum File {
    internal enum Extension {
      /// json
      internal static let json = L10n.tr("Localizable", "File.Extension.json")
    }
  }

  internal enum LaunchStorage {
    internal enum ValueKey {
      /// hasLaunched
      internal static let hasLaunched = L10n.tr("Localizable", "LaunchStorage.ValueKey.hasLaunched")
    }
  }

  internal enum Realm {
    internal enum Database {
      /// default
      internal static let defaultName = L10n.tr("Localizable", "Realm.Database.defaultName")
      /// realm_database_%@
      internal static func name(_ p1: Any) -> String {
        return L10n.tr("Localizable", "Realm.Database.name", String(describing: p1))
      }
      /// %@.realm
      internal static func path(_ p1: Any) -> String {
        return L10n.tr("Localizable", "Realm.Database.path", String(describing: p1))
      }
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
