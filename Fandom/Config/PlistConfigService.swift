//
//  PlistConfigService.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation

final class PlistConfigService: ConfigService {

    private let config: [String: Any]

    init?(with url: URL) {
        guard let config = NSDictionary(contentsOf: url) as? [String: Any] else {
            return nil
        }

        self.config = config
    }

    func value<ValueType>(for key: ConfigKey, as type: ValueType.Type) throws -> ValueType {
        guard let value = config[key.rawValue] else {
            throw ConfigError.keyNotFound
        }
        guard let castValue = value as? ValueType else {
            throw ConfigError.invalidType
        }
        return castValue
    }

}
