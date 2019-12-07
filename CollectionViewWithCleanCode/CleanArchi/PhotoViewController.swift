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
        let interactor = PhotoInteractor(dataGateway: dataGateway, flickerModel: FlickrModel.self)
        self.photoView = self.view as? PhotoView
        let photoViewModel = PhotoViewModel()
        photoViewModel.viewDelegate = self.photoView
        let presenter = PhotoPresenter(viewModel: photoViewModel)
        self.controller = PhotoController(homeInteractor:interactor, presenter: presenter)
        self.photoView?.bind(controller: controller!)
        self.setUpNavigation()
    }
    
    func setUpNavigation() {
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 50, y: 0, width: UIScreen.main.bounds.size.width-200, height: 20))
        searchBar.placeholder = "Enter Text"
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(searchButtonAction))
    }
    
    @objc func searchButtonAction() {
        self.controller?.searchPhoto()
    }
}
