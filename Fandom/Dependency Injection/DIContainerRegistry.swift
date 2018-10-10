//
//  DIRegisty.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import Swinject

protocol DIContainerRegistry {

    static func registerDependencies(in: Container)

}
