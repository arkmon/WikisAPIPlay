//
//  CoordinatorDelegate.swift
//  Solos_poc_Swift
//
//  Copyright © 2016 Kopin Software LTD . All rights reserved.
//

import UIKit

public protocol CoordinatorDelegate: class {
    
    func present(_: UIViewController)
    func dismiss(_: UIViewController)
    
}

public extension CoordinatorDelegate {
    
    func present(_ viewController: UIViewController) { }
    func dismiss(_ viewController: UIViewController) { }
    
}
