//
//  PhotoViewModel.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoViewModel {
    
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
    

    
    var sourceArray = [1,2,3]
    weak var viewDelegate: PhotoViewModelProtocol?
    
    func getSourceArray() -> [Int]{
        return sourceArray;
    }
    
    func showDefaultState() {
        
    }
    
    func showLoadingState() {
        
    }
    
    func showSuccessState() {
        
    }
    
    func showErrorState() {
        
    }
}
