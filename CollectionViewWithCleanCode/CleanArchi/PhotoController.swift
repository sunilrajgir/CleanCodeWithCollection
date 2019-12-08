//
//  PhotController.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoController {
    private let interactor : PhotoInteractor
    private let presenter : PhotoPresenter
    
    var currentPage = 1
    
    // @saber.inject
    init(homeInteractor : PhotoInteractor, presenter : PhotoPresenter) {
        self.interactor = homeInteractor
        self.presenter = presenter
    }
    
    func getViewData()-> [FlickrURLs] {
        return self.presenter.viewModel.getSourceArray()
    }
    
    func searchPhoto() {
        self.interactor.fetchData(url: "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&api_key=49b2afaa0f8ef1d1ec558b337ca989ff&text=cats&page=\(self.currentPage)&nojsoncallback=1") {[weak self] (data, error) in
            self?.presenter.showFetchedData(photoModel: data)
        }
    }
    
    func nextPageAction() {
        self.currentPage = currentPage+1;
        self.interactor.fetchData(url: "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&api_key=49b2afaa0f8ef1d1ec558b337ca989ff&text=cats&page=\(self.currentPage)&nojsoncallback=1") {[weak self] (data, error) in
            self?.presenter.showNextPageData(photoModel: data)
        }
    }
}
