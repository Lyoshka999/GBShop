//
//  NetworkModel.swift
//  GBShop
//
//  Created by Алексей on 01.03.2023.
//

import Foundation
import Alamofire

protocol NetworkModel {
    associatedtype T
    associatedtype U
    
    func send(_: T, completion: @escaping (AFDataResponse<U>) -> Void)
}
