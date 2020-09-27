//
//  FileReader.swift
//  Storage
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public class FileReader: NSObject, FileReading {

    public func get<T: Decodable>(_ type: T.Type, fileName: String) -> T? {
        let bundle = Bundle(for: Self.self)
        guard let url = bundle.url(forResource: fileName, withExtension: L10n.File.Extension.json) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return data.decode(T.self)
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
