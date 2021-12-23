//
//  MVCVC.swift
//  MVVMTest
//
//  Created by caruscha on 23/12/2021.
//

import UIKit

class MVCVC: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    private var menu: MenuModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didObtainAPIData()
    }
    
    func registerTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "DishCell", bundle: nil), forCellReuseIdentifier: "DishCell")
    }
    
    func didObtainAPIData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let menuData = NetworkService.getMenu()
            self.menu = try! JSONDecoder().decode(MenuModel.self, from: menuData)
            self.registerTableView()
            self.tableView.reloadData()
        }
    }

}

extension MVCVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.dishList?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath) as! DishCell
        if let dishList = menu.dishList {
            let dish = dishList[indexPath.row]
            cell.titleLB.text = dish.productName
            cell.priceLB.text = "$" + (dish.price ?? "0")
        }
        
        return cell
    }
    
    
}
