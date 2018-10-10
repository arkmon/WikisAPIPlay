//
//  ConfigDIContainerRegistry.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import Swinject

final class ConfigDIContainerRegistry: DIContainerRegistry {

    class func registerDependencies(in container: Container) {
		container.register(Bundle.self) { _ in
			Bundle.main
			}.inObjectScope(.container)
		
        container.register(ConfigService.self) { r in
            PlistConfigService(with: r.resolve(Bundle.self)!.url(forResource: "Config", withExtension: "plist")!)!
        }.inObjectScope(.container)
    }

}
