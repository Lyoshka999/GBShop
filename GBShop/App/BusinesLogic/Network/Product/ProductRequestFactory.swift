//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Алексей on 14.02.2023.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func getProductList(page: Int, category: Int, completion: @escaping (AFDataResponse<[Product]>) -> Void)
}
