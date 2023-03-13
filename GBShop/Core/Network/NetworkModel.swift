//
//  NetworkModel.swift
//  GBShop
//
//  Created by Алексей on 01.03.2023.
//

import Foundation

protocol NetworkModel {
    associatedtype T
    func send(_: T)
}
