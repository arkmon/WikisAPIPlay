//
//  MainCoordinator.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import UIKit


final class MainCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var root: UINavigationController?

    private var listCoordinator: ListCoordinator?

    init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }

    func start() {
        if let navigationController = viewController(named: "AppNavigationController", ofType: UINavigationController.self, in: storyboard(named: "App")) {
            root = navigationController
            delegate?.present(navigationController)
            showList()
        }
    }

    private func showList() {
        listCoordinator = ListCoordinator(with: self)
        listCoordinator?.start()
    }

}

// MARK: - CoordinatorDelegate

extension MainCoordinator: CoordinatorDelegate {

    func present(_ viewController: UIViewController) {
        root?.pushViewController(viewController, animated: true)
    }

}
