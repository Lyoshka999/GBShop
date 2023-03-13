//
//  RouterRequest.swift
//  GBShop
//
//  Created by Алексей on 13.02.2023.
//

import Foundation
import Alamofire

enum RequestRouterEncoding {
    case url
    case json
}

protocol RequestRouter: URLRequestConvertible {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullURL: URL { get }
    var encoding: RequestRouterEncoding { get }
}

extension RequestRouter {
    var fullURL: URL {
        return baseURL.appendingPathComponent(path)
    }
    var encoding: RequestRouterEncoding {
        return .url
    }
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: fullURL)
        urlRequest.httpMethod = method.rawValue
        switch self.encoding {
        case .url:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
