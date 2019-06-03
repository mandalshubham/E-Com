//
//  CategoryListPresenter.swift
//  E-Com
//
//  Created by Khushboo Verma on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

class CategoryListPresenter: CategoryListPresenterProtocol {
    
    weak var view: CategoryListViewProtocol?
    var interactor: CategoryListInteractorInputProtocol?
    var wireFrame: CategoryListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveCategoryList()
    }
    
    func showCategoryDetail(forCategory category: CategoryModel) {
        wireFrame?.presentCategoryDetailScreen(from: view!, forCategory: category)
    }
    
}

extension CategoryListPresenter: CategoryListInteractorOutputProtocol {
    
    func didRetrieveCategories(_ categories: [CategoryModel]) {
        view?.hideLoading()
        view?.showCategories(with: categories)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}
