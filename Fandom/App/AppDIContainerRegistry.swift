//
//  AppDIContainerRegistry.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import Swinject

final class AppDIContainerRegistry: DIContainerRegistry {

    class func registerDependencies(in container: Container) {
        container.register(Bundle.self) { _ in
            Bundle.main
        }.inObjectScope(.container)
    }
}
