//
//  CategoryListWireFrame.swift
//  E-Com
//
//  Created by Khushboo Verma on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import UIKit

class CategoryListWireFrame: CategoryListWireFrameProtocol {
    
    class func createCategoryListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "CategoryNavigationController")
        if let view = navController.children.first as? CategoryListViewController {
            let presenter: CategoryListPresenterProtocol & CategoryListInteractorOutputProtocol = CategoryListPresenter()
            let interactor: CategoryListInteractorInputProtocol & CategoryListRemoteDataManagerOutputProtocol = CategoryListInteractor()
            let localDataManager: CategoryListLocalDataManagerInputProtocol = CategoryListLocalDataManager()
            let remoteDataManager: CategoryListRemoteDataManagerInputProtocol = CategoryListRemoteDataManager()
            let wireFrame: CategoryListWireFrameProtocol = CategoryListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentCategoryDetailScreen(from view: CategoryListViewProtocol, forCategory category: CategoryModel) {
        //todo: Shubham Fig out the details
    }
    
    
}

