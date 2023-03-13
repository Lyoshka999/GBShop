//
//  LoginBussinesModel.swift
//  GBShop
//
//  Created by Алексей on 08.03.2023.
//

import Foundation
import Alamofire

class LoginBussinesModel: NetworkModel {

    private let requestFactory = RequestFactory()
    
    func send(_ loginFunction: LoginFunction, completion: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let loginRequestFactory = self.requestFactory.makeLoginRequestFactory()
        
        switch loginFunction {
        case .login:
            loginRequestFactory.login(userName: "Somebody", password: "mypassword", completionHandler: completion)
        }
    }
}
