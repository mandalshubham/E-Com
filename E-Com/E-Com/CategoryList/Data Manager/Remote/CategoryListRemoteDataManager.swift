//
//  CategoryListRemoteDataManager.swift
//  E-Com
//
//  Created by Shubham Mandal on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class CategoryListRemoteDataManager:CategoryListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: CategoryListRemoteDataManagerOutputProtocol?
    
    func retrieveCategoryList() {
        Alamofire
            .request(Endpoints.Categories.fetch.url, method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<CategoryResponse>) in
                switch response.result {
                case .success(let categoryResponse):
                    self.remoteRequestHandler?.onCategoriesRetrieved(categoryResponse.categories)
                    
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
