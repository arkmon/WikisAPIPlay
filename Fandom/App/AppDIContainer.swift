//
//  AppDIContainer.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import Swinject

final class AppDIContainer {
	static var container: Container! = nil
	static var registries: [DIContainerRegistry.Type] = [DIContainerRegistry.Type]()
	
	class func replaceContainer() {
		let newContainer = Container()
		
		registries.forEach { registry in
			registerDependencies(in: newContainer, from: registry)
		}
		
		container = newContainer
	}
	
	class func registerDependencies(in container: Container, from registry: DIContainerRegistry.Type) {
		registry.registerDependencies(in: container)
	}
	
	class func resolve<Service>(_ serviceType: Service.Type, name: String? = nil) -> Service? {
		return container?.resolve(serviceType, name: name)
	}
}
