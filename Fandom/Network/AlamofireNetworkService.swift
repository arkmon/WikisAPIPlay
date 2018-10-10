//
//  AlamofireNetworkService.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import Alamofire

import ReactiveSwift

final class AlamofireNetworkService: NetworkService {
	
    var sessionManager: Alamofire.SessionManager

    init(sessionManager: Alamofire.SessionManager) {
        self.sessionManager = sessionManager

    }

    func get(_ endpoint: URL, parameters: [String : Any]?) -> SignalProducer<Any?, NetworkError> {
        return SignalProducer { observer, _ in
			self.sessionManager.request(endpoint.absoluteString, parameters: parameters).responseJSON { response in
                guard let json = response.result.value else {
                    observer.send(error: .error)
                    return
                }
                observer.send(value: json)
                observer.sendCompleted()
            }
        }
    }
	
	private func createUrlStringWithQuery(url: URL, parameters: [String: Any]?) -> String {
		var urlWithQuery = url.absoluteString
		if let parameters = parameters, !parameters.isEmpty {
			urlWithQuery += "?"
			var firstValue = true
			for parameter in parameters {
				if !firstValue { urlWithQuery.append("&") }
				urlWithQuery.append(parameter.key + "=\(parameter.value)")
				firstValue = false
			}
		}
		return urlWithQuery
	}

}
