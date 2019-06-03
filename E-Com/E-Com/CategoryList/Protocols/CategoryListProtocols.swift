//
//  CategoryListProtocols.swift
//  E-Com
//
//  Created by Khushboo Verma on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import UIKit

protocol CategoryListViewProtocol: class {
    var presenter: CategoryListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCategories(with categories: [CategoryModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol CategoryListWireFrameProtocol: class {
    static func createCategoryListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentCategoryDetailScreen(from view: CategoryListViewProtocol, forCategory category: CategoryModel)
}

protocol CategoryListPresenterProtocol: class {
    var view: CategoryListViewProtocol? { get set }
    var interactor: CategoryListInteractorInputProtocol? { get set }
    var wireFrame: CategoryListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showCategoryDetail(forCategory category: CategoryModel)
}

protocol CategoryListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveCategories(_ categories: [CategoryModel])
    func onError()
}

protocol CategoryListInteractorInputProtocol: class {
    var presenter: CategoryListInteractorOutputProtocol? { get set }
    var localDatamanager: CategoryListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: CategoryListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveCategoryList()
}

protocol CategoryListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol CategoryListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: CategoryListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveCategoryList()
}

protocol CategoryListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onCategoriesRetrieved(_ categories: [CategoryModel])
    func onError()
}

protocol CategoryListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func retrieveCategoryList() throws -> [Category]
    func saveCategory(id: Int, name: String) throws
}

