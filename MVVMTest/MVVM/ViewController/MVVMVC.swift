//
//  MVVMVC.swift
//  MVVMTest
//
//  Created by caruscha on 23/12/2021.
//

import UIKit

class MVVMVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var menuVM: MenuViewModel!
    
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
            self.menuVM = MenuViewModel(menu: try! JSONDecoder().decode(MenuModel.self, from: menuData))
            self.registerTableView()
            self.tableView.reloadData()
        }
    }

}

extension MVVMVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuVM.numberOfRowsInSection(section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath) as! DishCell
        let dishVM = menuVM.getDish(indexPath.row)
        cell.titleLB.text = dishVM?.title
        cell.priceLB.text = dishVM?.price
        
        return cell
    }
    
    
}
