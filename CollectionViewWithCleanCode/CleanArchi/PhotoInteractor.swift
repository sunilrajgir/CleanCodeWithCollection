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
    
    func fetchData(url: String, completionBlock:@escaping((_ data:Data?, _ error:Error?)->Void))  {
    
        if(!self.connection.isConnected()) {
            completionBlock(nil, nil)
            return
        }else {
            self.dataGateway.loadUrlContent(url: url) { (data, error) in
                do
                {
                    let flickrPhotos = try JSONDecoder().decode(FlickrImageResult.self, from: data!)
                    print(flickrPhotos)
                    
                } catch {
                    print(error.localizedDescription)
                }
               
            }
        }

    }
}

struct FlickrImageResult: Codable {
    let photos : FlickrPagedImageResult?
    let stat: String
}

struct FlickrPagedImageResult: Codable {
    let photo : [FlickrURLs]
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
}

struct FlickrURLs: Codable {
    let id : String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    // let title: String
    // If needed, camel-case and use CodingKeys enum
    //let ispublic: Int
    //let isfriend: Int
    //let isfamily: Int
}
