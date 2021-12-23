//
//  MenuModel.swift
//  MVVMTest
//
//  Created by caruscha on 23/12/2021.
//

import Foundation

class MenuModel: Decodable {
    private(set) var dishList: [DishModel]?
    
    enum CodingKeys: String, CodingKey {
        case prouctList
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.dishList = try values.decode([DishModel].self, forKey: .prouctList)
    }
}
