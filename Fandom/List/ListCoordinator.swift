//
//  ListCoordinator.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import UIKit
import Swinject

final class ListCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var root: UINavigationController?

    var itemCoordinator: ItemCoordinator?

    init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }

    func start() {
		UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1726333201, green: 0.2416284084, blue: 0.3118401468, alpha: 1)
		UINavigationBar.appearance().tintColor = UIColor.white
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
		guard let listViewModel = AppDIContainer.resolve(ListViewModel.self) else {
			fatalError()
		}
		root = UINavigationController()
		
		let startScreen = ListViewController()
		
		startScreen.viewModel = listViewModel
		
		root?.pushViewController(startScreen, animated: false)
		if let root = root {
			delegate?.present(root)
		}
    }

}

// MARK: - CoordinatorDelegate

extension ListCoordinator: CoordinatorDelegate {

    func present(_ viewController: UIViewController) {
        delegate?.present(viewController)
    }

}

// MARK: - ListCoordinatorDelegate

extension ListCoordinator: ListCoordinatorDelegate {

    func didSelect(item: Item) {
        itemCoordinator = ItemCoordinator(with: self)
        itemCoordinator?.item = item
        itemCoordinator?.start()
    }

}
