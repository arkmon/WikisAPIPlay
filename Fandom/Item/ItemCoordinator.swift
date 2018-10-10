//
//  ItemCoordinator.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation

final class ItemCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var root: ItemViewController?

    var item: Item?

    init(with delegate: CoordinatorDelegate?) {
        self.delegate = delegate
    }

    func start() {
        guard let item = item else {
            return
        }

        AppDIContainer.container.register(ItemViewModel.self) { _ in
            ItemViewModel(with: item)
        }

    }

}
