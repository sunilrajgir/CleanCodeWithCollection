//
//  PhotoCollectionView.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class View: UIView {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var loaderView: UIActivityIndicatorView!
    @IBOutlet var messageView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var tryAgain: UIButton!
    
    var totalRecords = 0
    var sourceArray = [FlickrURLs]()
    var photoController : Controller?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(controller : Controller?) {
        self.photoController = controller
        let nib = UINib(nibName: "PhotoCollectionCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "PhotoCollectionCell")
        self.collectionView.register(UINib(nibName: "LoaderCollectionCell", bundle: nil), forCellWithReuseIdentifier: "LoaderCollectionCell")
        self.sourceArray = photoController?.getViewData() ?? [FlickrURLs]()
        self.setDefaultState()
    }
    
    func loadNextPageData() {
        self.photoController?.nextPageAction()
    }
    
    @IBAction func tryAgainButtonAction(_ sender: UIButton) {
        
    }
    
    func setDefaultState() {
        self.collectionView.isHidden = false
        self.messageView.isHidden  = true
        self.loaderView.isHidden = true
    }
    
}

extension View : PhotoViewModelProtocol {
    func showLoader() {
        
    }
    
    func showServerError() {
        
    }
    
    func showInternetConnectionError() {
        
    }
    
    func showData(array: [FlickrURLs]) {
        self.totalRecords = 209505
        self.sourceArray = array
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension View: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.totalRecords > self.sourceArray.count {
            return self.sourceArray.count+1
        } else {
            return self.sourceArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == self.sourceArray.count {
            return self.collectionView.dequeueReusableCell(withReuseIdentifier: "LoaderCollectionCell", for: indexPath)
        } else {
            return self.collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionCell", for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == self.sourceArray.count {
             let width = UIScreen.main.bounds.size.width-20
             return CGSize(width: width, height: 44)
        } else {
            let width = (UIScreen.main.bounds.size.width-60)/3
             return CGSize(width: width, height: width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let collectionCell = cell as? PhotoCollectionCell, indexPath.row < self.sourceArray.count   {
            collectionCell.fetchImage(imageModel: self.sourceArray[indexPath.row])
        } else if cell.isKind(of: LoaderCollectionCell.self) {
            self.loadNextPageData()
        }
    }
    
}
