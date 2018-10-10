//
//  ItemViewModel.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation

final class ItemViewModel {

    var item: Item

    init(with item: Item) {
        self.item = item
    }

    var itemTitle: String {
        return item.title
    }

}
