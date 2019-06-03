//
//  CategoryListViewController.swift
//  E-Com
//
//  Created by Khushboo Verma on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import UIKit

class CategoryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: CategoryListPresenterProtocol?
    var categoryList: [CategoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
}
    
extension CategoryListViewController: CategoryListViewProtocol {
    func showCategories(with categories: [CategoryModel]) {
        categoryList = categories
        tableView.reloadData()
    }
    
    
    func showError() {
        print("ERRRRRRROOORRRRRR")
        //HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
       // HUD.show(.progress)
    }
    
    func hideLoading() {
       // HUD.hide()
    }
    
}

extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath) as! CategoryListCell
        
        let category = categoryList[indexPath.row]
        cell.updateCell(forCategory: category)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //presenter?.showPostDetail(forPost: postList[indexPath.row])
    }
    
}

