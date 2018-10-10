//  AppDelegate.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
	var root: UIViewController?
    weak var delegate: CoordinatorDelegate?
	
    var startScreenViewCoordinator: ListCoordinator?
    
    required init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }
    
    func start() {
		
        startScreenViewCoordinator = ListCoordinator(with: self)
        startScreenViewCoordinator?.start()
		
		if let root = root {
			delegate?.present(root)
		}
    }
}

extension AppCoordinator: CoordinatorDelegate {
    func present(_ viewController: UIViewController) {
        delegate?.present(viewController)
		return
    }

	func dismiss(_ viewController: UIViewController) {
		viewController.dismiss(animated: true, completion: nil)
	}
}
