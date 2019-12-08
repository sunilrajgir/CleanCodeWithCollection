//
//  PhotoViewController.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class PhotoViewController: UIViewController {
    var photoView : View?
    var controller : Controller?
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataGateway = DataFetcher()
        let interactor = Interactor(dataGateway: dataGateway, flickerModel: FlickrModel.self)
        self.photoView = self.view as? View
        let photoViewModel = ViewModel()
        photoViewModel.viewDelegate = self.photoView
        let presenter = Presenter(viewModel: photoViewModel)
        self.controller = Controller(homeInteractor:interactor, presenter: presenter)
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
