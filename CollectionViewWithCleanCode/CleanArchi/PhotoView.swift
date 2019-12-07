//
//  PhotoCollectionView.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoView: UIView {
    var photoController : PhotoController?
    func bind(controller : PhotoController) {
        self.photoController = controller
    }

}
