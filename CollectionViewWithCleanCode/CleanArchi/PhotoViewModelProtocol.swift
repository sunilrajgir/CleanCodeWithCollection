//
//  PhotoViewModelProtocol.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

protocol PhotoViewModelProtocol: NSObject {
    func showLoader()
    func showServerError()
    func showInternetConnectionError()
    func showData(array:[Int])
}
