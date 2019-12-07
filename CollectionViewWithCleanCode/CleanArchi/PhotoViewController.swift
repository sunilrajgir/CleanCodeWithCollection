//
//  PhotoViewController.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var photoView : PhotoView?
    var controller : PhotoController?
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataGateway = PhotoDataGateway()
        let connectionGateway = PhotoConnectionGateway()
        let interactor = PhotoInteractor(dataGateway: dataGateway, connectionGateway: connectionGateway)
        self.photoView = self.view as? PhotoView
        let photoViewModel = PhotoViewModel()
        photoViewModel.viewDelegate = self.photoView
        let presenter = PhotoPresenter(viewModel: photoViewModel)
        self.controller = PhotoController(homeInteractor:interactor, presenter: presenter)
        self.photoView?.bind(controller: controller!)
    }
    
    override class func awakeFromNib() {
        
    }

}
