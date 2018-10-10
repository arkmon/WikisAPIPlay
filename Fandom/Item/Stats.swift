//  Stats.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation

struct Stats: Codable {
	let edits, articles, pages, users: Int
	let activeUsers, images, videos, admins: Int
	let discussions: Int?
}
