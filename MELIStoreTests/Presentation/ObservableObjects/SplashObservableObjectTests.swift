//
//  SplashObversableObjectTests.swift
//  MELIStoreTests
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStore

final class SplashObservableObjectTests: XCTestCase {

    func testExample() async throws {
        // Arrange
        let sut = await SplashObservableObject()
        
        // Act
        await sut.start()
        
        let result = await sut.route
        
        // Assert
        let route = try XCTUnwrap(result)
        
        XCTAssert(route == .products)
    }
}
