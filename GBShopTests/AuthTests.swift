//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Алексей on 14.02.2023.
//

import XCTest
import Alamofire
@testable import GBShop

class AuthTests: XCTestCase {

    let exeptation = XCTestExpectation(description: "Download")
    let requestFactory = RequestFactory()
    
    func testLogout() {
        let auth = self.requestFactory.makeAuthRequestFactory()
        auth.logout(userID: "123") { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
            case .failure(let error):
                print(error)
                XCTFail()
            }
            self.exeptation.fulfill()
        }
        wait(for: [self.exeptation], timeout: 5)
    }
    
    func testLogin() {
        let auth = self.requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                XCTAssert(login.result == 1)
                XCTAssert(login.user.id == 123)
            case .failure(let error):
                print(error)
                XCTFail()
            }
            self.exeptation.fulfill()
        }
        wait(for: [self.exeptation], timeout: 5)
    }

}
