//
//  Coordinator.swift
//  Solos_poc_Swift
//
//  Copyright © 2017 Kopin Software LTD . All rights reserved.
//

import UIKit

public protocol Coordinator: class {
	
	associatedtype ViewControllerType: UIViewController
	
	weak var delegate: CoordinatorDelegate? { get set }
	var root: ViewControllerType? { get set }
	
	init(with: CoordinatorDelegate?)
	
	func start()
	
}

// MARK: - Storyboards

public extension Coordinator {
	
	func storyboard(named name: String, in bundle: Bundle = Bundle.main) -> UIStoryboard {
		return UIStoryboard.init(name: name, bundle: bundle)
	}
	
	func viewController<T>(named name: String, ofType type: T.Type, in storyboard: UIStoryboard) -> T? {
		return storyboard.instantiateViewController(withIdentifier: name) as? T
	}
	
}

