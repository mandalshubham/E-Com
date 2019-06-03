//
//  CategoryListInteractor.swift
//  E-Com
//
//  Created by Shubham Mandal on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

class CategoryListInteractor: CategoryListInteractorInputProtocol {
    
    weak var presenter: CategoryListInteractorOutputProtocol?
    var localDatamanager: CategoryListLocalDataManagerInputProtocol?
    var remoteDatamanager: CategoryListRemoteDataManagerInputProtocol?
    
    func retrieveCategoryList() {
        do {
            if let categoryList = try localDatamanager?.retrieveCategoryList() {
                let categoryModelList = categoryList.map() {
                    return CategoryModel(id: Int($0.id), name: $0.name!, products: Array($0.products!) as! [ProductModel])
                }
                if  categoryModelList.isEmpty {
                    remoteDatamanager?.retrieveCategoryList()
                }else{
                    presenter?.didRetrieveCategories(categoryModelList)
                }
            } else {
                remoteDatamanager?.retrieveCategoryList()
            }
            
        } catch {
            presenter?.didRetrieveCategories([])
        }
    }
    
}

extension CategoryListInteractor: CategoryListRemoteDataManagerOutputProtocol {
    
    func onCategoriesRetrieved(_ categories: [CategoryModel]) {
        presenter?.didRetrieveCategories(categories)
        
        for categoryModel in categories {
            do {
                try localDatamanager?.saveCategory(id: categoryModel.id, name: categoryModel.name, products: categoryModel.products)
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
