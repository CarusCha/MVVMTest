//
//  MenuViewModel.swift
//  MVVMTest
//
//  Created by caruscha on 23/12/2021.
//

import Foundation

struct MenuViewModel {
    private let menu: MenuModel!
    
    init(menu: MenuModel) {
        self.menu = menu
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return menu.dishList?.count ?? 0
    }
    
    func getDish(_ index: Int) -> DishViewModel? {
        guard let dishList = menu.dishList else {
            return nil
        }
        
        return DishViewModel(dish: dishList[index])
    }
    
}


struct DishViewModel {
    private let dish: DishModel!
    
    init(dish: DishModel) {
        self.dish = dish
    }
    
    var title: String? {
        return dish.productName
    }
    
    var price: String? {
        return "$" + (dish.price ?? "0")
    }
    
}

