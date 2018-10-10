//
//  JSONConfigServiceTests.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import XCTest
@testable import Fandom

class JSONConfigServiceTests: XCTestCase {

    func testInit() {
        // Given
        let endpoint = ""
        let json =  "{\n" +
                    "\"Endpoint\": \"\(endpoint)\"\n" +
                    "}"
        let jsonData = json.data(using: .utf8)!

        // When
        let sut = JSONConfigService(with: jsonData)

        // Then
        XCTAssertNotNil(sut)
    }

    func testInitFail() {
        // Given
        let endpoint = ""
        let json =  "{\n" +
                    "\"Endpoint\": \"\(endpoint)\"\n"

        let jsonData = json.data(using: .utf8)!

        // When
        let sut = JSONConfigService(with: jsonData)

        // Then
        XCTAssertNil(sut)
    }

    func testInitString() {
        // Given
        let endpoint = ""
        let json =  "{\n" +
                    "\"Endpoint\": \"\(endpoint)\"\n" +
                    "}"

        // When
        let sut = JSONConfigService(with: json)

        // Then
        XCTAssertNotNil(sut)
    }

    func testInitStringFail() {
        // Given
        let endpoint = ""
        let json =  "{\n" +
            "\"Endpoint\": \"\(endpoint)\"\n"

        // When
        let sut = JSONConfigService(with: json)

        // Then
        XCTAssertNil(sut)
    }

    func testValueForKey() {
        // Given
        let endpoint = ""
        let json =  "{\n" +
                    "\"Endpoint\": \"\(endpoint)\"\n" +
                    "}"
        let jsonData = json.data(using: .utf8)!
        let sut = JSONConfigService(with: jsonData)!

        // When
        let value = try? sut.value(for: .endpoint, as: String.self)

        // Then
        XCTAssertNotNil(value)
        XCTAssertEqual(value, endpoint)
    }

}
