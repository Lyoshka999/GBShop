//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Алексей on 08.03.2023.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(userId: Int, textReview: String, completion: @escaping (AFDataResponse<ResultUserMessage>) -> Void )
}
