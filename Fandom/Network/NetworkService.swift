//
//  NetworkService.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol NetworkService {
	
	func get(_: URL, parameters: [String: Any]?) -> SignalProducer<Any?, NetworkError>
	
}
