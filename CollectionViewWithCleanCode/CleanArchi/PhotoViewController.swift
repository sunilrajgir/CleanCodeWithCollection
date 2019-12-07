//
//  PhotoViewController.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var photoCollectionView : PhotoView?
    var controller : PhotoController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controller = PhotoController()
        self.photoCollectionView = self.view as? PhotoView
        self.photoCollectionView?.bind(controller: controller!)
    }
    
    override class func awakeFromNib() {
        
    }

}
