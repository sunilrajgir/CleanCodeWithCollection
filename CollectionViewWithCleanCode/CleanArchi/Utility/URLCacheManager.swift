//
//  URLCacheManager.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/8/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class URLCacheManager {
    static let shared = URLCacheManager()
    var dataCache = NSCache<NSString, AnyObject>()
    
    func getDataForKey(key:NSString)->AnyObject? {
        return self.dataCache.object(forKey: key)
    }
    
    func addDataToCache(data:AnyObject,key:NSString) {
        self.dataCache.setObject(data, forKey: key)
    }
}


