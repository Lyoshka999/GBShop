//
//  LoginRequestFactory.swift
//  GBShop
//
//  Created by Алексей on 08.03.2023.
//

import Foundation
import Alamofire

protocol LoginRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
