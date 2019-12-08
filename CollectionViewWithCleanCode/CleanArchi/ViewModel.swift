//
//  PhotoViewModel.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class ViewModel {
    
    var canShowLoader: Bool? {
        didSet {
            
        }
    }
    
    var canShowServerError: Bool? {
        didSet {
            
        }
    }
    
    var canShowNetworkError: Bool? {
        didSet {
             
         }
    }
    
    var canShowData: Bool? {
        didSet {
             
         }
    }
    

    
    var sourceArray = [FlickrURLs]()
    weak var viewDelegate: PhotoViewModelProtocol?
    
    func getSourceArray() -> [FlickrURLs]{
        return sourceArray;
    }
    
    func showDefaultState() {
        
    }
    
    func showLoadingState() {
        
    }
    
    func showData(data:Any) {
        if let photoModel = data as? FlickrModel {
            self.sourceArray = photoModel.photos!.photo
            self.viewDelegate?.showData(array: self.sourceArray)
        }
    }
    
    func showNextPageData(data:Any)  {
        if let photoModel = data as? FlickrModel {
            self.sourceArray.append(contentsOf: photoModel.photos!.photo)
            self.viewDelegate?.showData(array: self.sourceArray)
        }
    }
    
    func showErrorState() {
        
    }
}
