//
//  UserDefaults.swift
//  GBShop
//
//  Created by Алексей on 14.03.2023.
//

import Foundation

typealias BasketList = [BasketItem]

extension UserDefaults {
    func setBasket(_ basketList: BasketList) {
        let data = try? JSONEncoder().encode(basketList)
        UserDefaults.standard.set(data, forKey: Const.shared.basketKey)
    }
    
    func getBasketList() -> BasketList {
        var basketList: BasketList = []
        if let data = UserDefaults.standard.data(forKey: Const.shared.basketKey) {
            if let decodeData = try? JSONDecoder().decode(BasketList.self, from: data) {
                basketList = decodeData
            }
        }
        return basketList
    }
}
