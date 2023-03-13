//
//  BasketBussinesModel.swift
//  GBShop
//
//  Created by Алексей on 01.03.2023.
//

import Foundation

class BasketBussinesModel: NetworkModel {
    
    private let requestFactory = RequestFactory()
    
    func send(_ basketFunction: BasketFunction) {
        
        let basketRequestFactory = self.requestFactory.makeBasketRequestFactory()
        
        switch basketFunction {
        case .addToBasket:
            for item in 1...10 {
                let idProduct = item
                let quantity = item + 10
                basketRequestFactory.addToBasket(idProduct: idProduct, quantity: quantity) { response in
                    switch response.result {
                    case .success(let result):
                        print("add to basket product \(idProduct) quantity \(quantity) result \(result)")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        case .deleteFromBasket:
            let idProduct = 123
            basketRequestFactory.deleteFromBasket(idProduct: idProduct) { response in
                switch response.result {
                case .success(let result):
                    print("delete from basket product \(idProduct) result \(result)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case .payBasket:
            basketRequestFactory.payBasket()
            
        }
    }
}
