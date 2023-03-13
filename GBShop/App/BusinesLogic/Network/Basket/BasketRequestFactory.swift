//
//  BasketRequestFactory.swift
//  GBShop
//
//  Created by Алексей on 27.02.2023.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func addToBasket(idProduct: Int, quantity: Int, completion: @escaping (AFDataResponse<ResponseResult>) -> Void)
    func deleteFromBasket(idProduct: Int, completion: @escaping (AFDataResponse<ResponseResult>) -> Void)
    func payBasket()
}

