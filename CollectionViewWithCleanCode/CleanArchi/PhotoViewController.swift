//
//  PhotoViewController.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var photoCollectionView : PhotoCollectionView?
    var controller : PhotController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controller = PhotController()
        self.photoCollectionView = self.view as? PhotoCollectionView
        self.photoCollectionView?.bind(controller: controller!)
    }

}
