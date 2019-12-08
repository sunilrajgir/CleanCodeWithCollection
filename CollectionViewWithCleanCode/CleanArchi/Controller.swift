//
//  PhotController.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class Controller {
    private let interactor : Interactor
    private let presenter : Presenter
    
    var currentPage = 1
    var text : String = ""
    
    // @saber.inject
    init(homeInteractor : Interactor, presenter : Presenter) {
        self.interactor = homeInteractor
        self.presenter = presenter
    }
    
    func getViewData()-> [FlickrURLs] {
        return self.presenter.viewModel.getSourceArray()
    }
    
    internal func searchPhoto(text:String) {
        self.text = text
        if let url = self.getListUrl() {
            self.interactor.fetchData(url: url) {[weak self] (data, error) in
                self?.presenter.showFetchedData(photoModel: data)
            }
        }
    }
    
    internal func nextPageAction() {
        self.currentPage = currentPage+1;
        if let url = self.getListUrl() {
            self.interactor.fetchData(url: url) {[weak self] (data, error) in
                self?.presenter.showNextPageData(photoModel: data)
            }
        }
    }
    
   private func getListUrl()->URL? {
        var listUrl = URLManager.getListUrl()
        listUrl = listUrl.replacingOccurrences(of: Constant.text, with: self.text)
        listUrl = listUrl.replacingOccurrences(of: Constant.page, with: "\(self.currentPage)")
        return URL(string: listUrl)
    }
}
