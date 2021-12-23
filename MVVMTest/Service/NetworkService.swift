//
//  NetworkService.swift
//  MVVMTest
//
//  Created by caruscha on 23/12/2021.
//

import Foundation


class NetworkService {
    
    class func getMenu() -> Data {
        let path = Bundle.main.path(forResource: "menuData", ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
    }
}
