//
//  Certificates.swift
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Alamofire
import OxeNetworking

public enum Certificates: Certificate, CaseIterable {
    case none

    public var files: [CertificateFileConvertible] {
        return []
    }

    public var evaluatorKey: String {
        return ""
    }
}
