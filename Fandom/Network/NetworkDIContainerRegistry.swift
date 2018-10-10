//
//  NetworkDIContainerRegistry.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import Swinject
import Alamofire

final class NetworkDIContainerRegistry: DIContainerRegistry {

    class func registerDependencies(in container: Container) {
        container.register(Alamofire.SessionManager.self) { _ in Alamofire.SessionManager.default }.inObjectScope(.container)

        container.register(NetworkService.self) { r in
            AlamofireNetworkService(sessionManager: r.resolve(Alamofire.SessionManager.self)!)
        }.inObjectScope(.container)
    }

}
