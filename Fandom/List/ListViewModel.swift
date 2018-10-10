//
//  ListViewModel.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import ReactiveSwift

final class ListViewModel {

    var items = MutableProperty<[Item]>([Item]())

    let listService: ListService
    weak var coordinatorDelegate: ListCoordinatorDelegate?

    init(listService: ListService) {
        self.listService = listService
    }

    func numberOfItems() -> Int {
        return items.value.count
    }

    func item(at indexPath: IndexPath) -> Item {
        return items.value[indexPath.row]
    }
	
	func numberOfVideos(at indexPath: IndexPath)  -> String? {
		return items.value[indexPath.row].stats.videos.roundedWithAbbreviations
	}
	
	func numberOfDiscussions(at indexPath: IndexPath)  -> String? {
		return items.value[indexPath.row].stats.discussions?.roundedWithAbbreviations
	}
	
	func numberOfArticles(at indexPath: IndexPath)  -> String? {
		return items.value[indexPath.row].stats.articles.roundedWithAbbreviations
	}
	
}

// MARK: - Lifecycle

extension ListViewModel {

    func viewDidLoad() {
        guard let signalProducer = try? listService.fetchList() else {
            return
        }

        signalProducer.startWithSignal { signal, _ in
            signal.observeResult { result in
                switch result {
                case .failure(_):
                    self.items.value = [Item]()
                case let .success(items):
                    self.items.value = items
                }
            }
        }
    }
}

// MARK: - 

extension ListViewModel {

    func selectedRow(at indexPath: IndexPath) {
        let item = self.item(at: indexPath)
        coordinatorDelegate?.didSelect(item: item)
    }

}

extension Int {
	var roundedWithAbbreviations: String {
		let number = Double(self)
		let thousand = number / 1000
		let million = number / 1000000
		if million >= 1.0 {
			return "\(Int(million*10)/10)m"
		}
		else if thousand >= 1.0 {
			return "\(Int(thousand*10)/10)k"
		}
		else {
			return "\(Int(number))"
		}
	}
}
