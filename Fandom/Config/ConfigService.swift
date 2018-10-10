//
//  ConfigService.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation

protocol ConfigService {

    func value<ValueType>(for: ConfigKey, as: ValueType.Type) throws -> ValueType

}
