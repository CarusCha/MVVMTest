//
//  DishModel.swift
//  MVVMTest
//
//  Created by caruscha on 23/12/2021.
//

import Foundation

class DishModel: Codable {
    private(set) var productName: String?
    private(set) var price : String?
    
    enum CodingKeys: String, CodingKey {
        case productName
        case price
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.productName = try values.decode(String.self, forKey: .productName)
        self.price = try values.decode(String.self, forKey: .price)

    }
}
