//  FandomTests.swift
//  FandomTests
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import XCTest
@testable import Fandom
import ReactiveSwift

class FandomTests: XCTestCase {

	func testNumberOfItems() {
		// Given
		
		let stts = Stats(edits: 4, articles: 3, pages: 2, users: 6, activeUsers: 5, images: 3, videos: 2, admins: 1, discussions: 6)
		
		let items = [Item(title: "", stats: stts, desc: "", image: "")]
		
		let listService = ListServiceMock(with: items)
		let sut = ListViewModel(listService: listService)
		
		// When
		sut.viewDidLoad()
		
		// Then
		XCTAssertEqual(sut.numberOfItems(), items.count)
	}
	func testRoundedVariables() {
		// Given
		let stts = Stats(edits: 4000, articles: 33000, pages: 23251, users: 24532, activeUsers: 242322342, images: 3, videos: 2, admins: 2, discussions: 6)
		
		let items = [Item(title: "", stats: stts, desc: "", image: ""),Item(title: "", stats: stts, desc: "", image: "")]
		
		
		let listService = ListServiceMock(with: items)
		let sut = ListViewModel(listService: listService)
		// When
		sut.viewDidLoad()
		// Then
		XCTAssertEqual(sut.item(at: IndexPath(row: 1, section: 0)).stats.pages.roundedWithAbbreviations, "23k")
		XCTAssertEqual(sut.item(at: IndexPath(row: 1, section: 0)).stats.activeUsers.roundedWithAbbreviations, "242m")
		XCTAssertEqual(sut.item(at: IndexPath(row: 1, section: 0)).stats.articles.roundedWithAbbreviations, "33k")
		XCTAssertEqual(sut.item(at: IndexPath(row: 1, section: 0)).stats.videos.roundedWithAbbreviations, "2")
	}
	
	func testNumberOfItemsWhenFailure() {
		// Given
		let listService = ListServiceMock()
		let sut = ListViewModel(listService: listService)
		
		// When
		sut.viewDidLoad()
		
		// Then
		XCTAssertEqual(sut.numberOfItems(), 0)
	}
	
	func testItemAtIndexPath() {
		// Given
		let stts = Stats(edits: 4, articles: 3, pages: 2, users: 6, activeUsers: 5, images: 3, videos: 2, admins: 1, discussions: 6)
		
		let items = [Item(title: "", stats: stts, desc: "", image: ""), Item(title: "", stats: stts, desc: "", image: "")]
		
		let listService = ListServiceMock(with: items)
		let sut = ListViewModel(listService: listService)
		
		// When
		sut.viewDidLoad()
		
		// Then
		XCTAssertEqual(sut.item(at: IndexPath(row: 1, section: 0)), items[1])
	}
	
}

// MARK: - ListServiceMock

fileprivate class ListServiceMock: ListService {
	
	var items: [Item]?
	
	init(with items: [Item]? = nil) {
		self.items = items
	}
	
	func fetchList() -> SignalProducer<[Item], ListError> {
		return SignalProducer { observer, _ in
			if let items = self.items {
				observer.send(value: items)
				observer.sendCompleted()
			} else {
				observer.send(error: .couldNotFetch)
			}
		}
	}

}
