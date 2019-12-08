//
//  ImageDownloadManager.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class ImageDownloader {
    static let shared  = ImageDownloader()
    var urlSession : URLSessionTask?
    private init() {
        self.setUpUrlSession()
    }
    
    func setUpUrlSession()  {
        
    }
    
}
