//
//  ProductBussinesModel.swift
//  GBShop
//
//  Created by Алексей on 01.03.2023.
//

import Foundation

class ProductBussinesModel: NetworkModel {
    
    private let requestFactory = RequestFactory()
    
    func send(_ producFunction: ProductFunction) {
        let productRequestFactory = self.requestFactory.makeProductListRequestFactory()
        
        switch producFunction {
        case .getProductList:
            productRequestFactory.getProductList(page: 1, category: 1) { response in
                switch response.result {
                case .success(let result):
                    print("result \(result)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
