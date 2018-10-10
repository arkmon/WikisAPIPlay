//
//  RemoteListService.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import ReactiveSwift

final class RemoteListService: ListService {
	
	let networkService: NetworkService
	let configService: ConfigService
	
	init(networkService: NetworkService, configService: ConfigService) {
		self.networkService = networkService
		self.configService = configService
	}
	
	func fetchList() throws -> SignalProducer<[Item], ListError> {
		guard let endpointString = try? configService.value(for: .endpoint, as: String.self), let endpoint = URL(string: endpointString) else {
			throw ListError.couldNotFetch
		}
		// Doing this manually here, not much time for pagination
		var parameters = [String: Any]()
		parameters["expand"] = 1
		parameters["limit"] = 25
		parameters["batch"] = 1
		
		let signalProducer = self.networkService.get(endpoint.appendingPathComponent("api/v1/Wikis/List"), parameters: parameters)
		return signalProducer.mapError { _ in
			ListError.couldNotFetch
			}.map { json in
				self.parse(list: json)
		}
	}
	
	private func parse(list json: Any) -> [Item] {
		var items = [Item]()
		do {
			if let dict = json as? [String: Any],
				let productData = dict["items"] as? [[String: Any]] {
				let backToBytes = try JSONSerialization.data(withJSONObject: productData, options: [])
				let wikisResponse = try JSONDecoder().decode([Item].self, from:backToBytes)
				
				items = wikisResponse
				
			}
		} catch let err {
			print(err)
		}
		
		return items
	}
	
}
