//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Алексей on 14.02.2023.
//

import XCTest
import Alamofire
@testable import GBShop

class ResponseCodableTests: XCTestCase {

    let exeptation = XCTestExpectation(description: "Download")
    var errorParser: ErrorParserStub!
    
    override func setUpWithError() throws {
        self.errorParser = ErrorParserStub()
    }
    
    override func tearDownWithError() throws {
        self.errorParser = nil
    }
    
    func testShouldDownloadAndParse() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .resposeCadable(errorParser: errorParser) { (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
                self.exeptation.fulfill()
            }
        wait(for: [self.exeptation], timeout: 10)
    }
}

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

