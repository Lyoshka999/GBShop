//
//  AbstractFactoryRequest.swift
//  GBShop
//
//  Created by Алексей on 13.02.2023.
//

import Foundation
import Alamofire

protocol AbstactRequestFactory {
    var errorParser: AbstractErrorParser { get }
    var sessionManager: Session { get }
    var queue: DispatchQueue { get }
    func request<T: Decodable>(request: URLRequestConvertible,
                               completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest
}

extension AbstactRequestFactory {
    public func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest {
        return sessionManager.request(request).resposeCadable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
    }
}
