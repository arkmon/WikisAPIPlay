//
//  Item.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation

struct Item: Codable {

    let title: String
	let stats: Stats
	let desc: String
	let image: String

	init(title: String,
		stats: Stats,
		desc: String,
		image: String) {
		self.title = title
		self.stats = stats
		self.desc = desc
		self.image = image
	}
}

extension Item: Equatable { }
// made for testing
func == (lhs: Item, rhs: Item) -> Bool {
	return lhs.title == rhs.title
}
