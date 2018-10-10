//
//  ListDIContainterRegistry.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import Swinject


final class ListDIContainerRegistry: DIContainerRegistry {

    class func registerDependencies(in container: Container) {
        container.register(ListService.self) { r in
            RemoteListService(networkService: r.resolve(NetworkService.self)!, configService: r.resolve(ConfigService.self)!)
        }.inObjectScope(.container)

        container.register(ListViewModel.self) { r in
            ListViewModel(listService: r.resolve(ListService.self)!)
        }
    }

}
