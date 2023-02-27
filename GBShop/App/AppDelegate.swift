//
//  AppDelegate.swift
//  GBShop
//
//  Created by Алексей on 06.02.2023.
//

import UIKit
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let auth = requestFactory.makeAuthRequestFactory()
//        auth.login(userName: "Somebody", password: "mypassword") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            auth.logout(userID: "123") { response in
//                switch response.result {
//                case .success(let logout):
//                    print("logout \(logout)")
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            auth.registry(userID: "123", userName: "123", password: "123", email: "123") { response in
//                switch response.result {
//                case .success(let logout):
//                    print("registry \(logout)")
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            auth.changeUserData(userID: "123", userName: "123", password: "123", email: "123") { response in
//                switch response.result {
//                case .success(let logout):
//                    print("changeUserData \(logout)")
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
        
//        let productRequestFactory = self.requestFactory.makeProductListRequestFactory()
//        productRequestFactory.getProductList(page: 1, category: 1) { response in
//            switch response.result {
//            case .success(let result):
//                print("результат \(result)")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        let reviewRequestFactory = self.requestFactory.makeReviewRequestFactory()
        reviewRequestFactory.addReview(userId: 123, textReview: "test") { response in
            switch response.result {
            case .success(let result):
                print("add \(result)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        reviewRequestFactory.approveReview(idComment: 123) { response in
            switch response.result {
            case .success(let result):
                print("approve \(result)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        reviewRequestFactory.deleteReview(idComment: 123){ response in
            switch response.result {
            case .success(let result):
                print("delete \(result)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
       
        let basketRequestFactory = self.requestFactory.makeBasketRequestFactory()
        
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
        
        basketRequestFactory.payBasket()
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}
