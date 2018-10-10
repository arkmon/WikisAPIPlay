//
//  ListService.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol ListService {

    func fetchList() throws -> SignalProducer<[Item], ListError>

}
