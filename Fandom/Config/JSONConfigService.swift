//
//  JSONConfigService.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation

final class JSONConfigService: ConfigService {

    private let config: [String: Any]

    convenience init?(with string: String) {
        guard let data = string.data(using: .utf8) else {
            return nil
        }

        self.init(with: data)
    }

    init?(with data: Data) {
        do {
            guard let config = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                return nil
            }
            self.config = config
        } catch {
            return nil
        }
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
