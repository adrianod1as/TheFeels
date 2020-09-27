//
//  SetupConstants.swift
//  TheFeels
//
//  Created by Adriano Dias on 27/09/20.
//

import Networking
import OxeNetworking
import Keys

struct SetupConstants {

    static let group: String = {
        return L10n.App.group
    }()

    static let identifier: String = {
        return L10n.App.identifier
    }()

    static let defaultEnvironmentType: EnvironmentType = {
        return .development
    }()

    static let defaultFixturesType: FixturesType = .none

    static let commonHeaders: Headers = {
        return [L10n.Headers.Keys.accept: L10n.Headers.Values.jsonApplication]
    }()

    static let specificHeaders: SpecificHeaders = {
        return [:]
    }()

    static let environment: Environment = {
        return Environment(type: defaultEnvironmentType, fixturesType: defaultFixturesType,
                           commonHeaders: commonHeaders, specificHeaders: specificHeaders)
    }()
}
