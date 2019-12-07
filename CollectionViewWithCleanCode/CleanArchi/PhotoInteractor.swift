//
//  PhotoInteractor.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

enum ResponseState {
    case SUCCESS
    case SERVER_FAILURE
    case OFFLINE
}

class PhotoInteractor {

    private let dataGateway : PhotoDataGateway
    private let connection : PhotoConnectionGateway
    
    init(dataGateway : PhotoDataGateway, connectionGateway : PhotoConnectionGateway) {
        self.dataGateway = dataGateway
        self.connection = connectionGateway
    }
    
    func fetchData(url: String, completionBlock:((_ data:Data?, _ error:Error?)->Void))  {
    
        if(!self.connection.isConnected()) {
            completionBlock(nil, nil)
            return
        }else {
            self.dataGateway.loadUrlContent(url: "abc") { (data, error) in
                completionBlock(nil,nil)
            }
        }

    }
}
