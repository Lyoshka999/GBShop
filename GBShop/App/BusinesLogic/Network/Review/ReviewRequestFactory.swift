//
//  ReviewRequestFactory.swift
//  GBShop
//
//  Created by Алексей on 23.02.2023.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func addReview(userId: Int, textReview: String, completion: @escaping (AFDataResponse<ResultUserMessage>) -> Void )
    func approveReview(idComment: Int, completion: @escaping (AFDataResponse<ResponseResult>) -> Void)
    func deleteReview(idComment: Int, completion: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
