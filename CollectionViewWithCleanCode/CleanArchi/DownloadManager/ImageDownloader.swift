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
    let operationQueue = OperationQueue()
    var urlSession : URLSessionTask?
    private init() {
        self.setOperationQueue()
    }
    
    func setOperationQueue()  {
        self.operationQueue.maxConcurrentOperationCount = 10
        self.operationQueue.qualityOfService = .background
    }
    
    func downloadImage(url: String, completion:@escaping((_ image:UIImage?, _ error: Error?)->Void)) {
        let operation = BlockOperation {
            let requestUrl =  URL(string: url)
            let request = URLRequest(url: requestUrl!)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let imageData = data, error == nil, let image = UIImage(data: imageData)  {
                    completion(image, nil)
                } else {
                    completion(nil, error)
                }
            }.resume()
        }
        self.operationQueue.addOperation(operation)
    }
    
}
