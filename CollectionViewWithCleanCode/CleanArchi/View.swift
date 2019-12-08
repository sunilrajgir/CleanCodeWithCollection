//
//  PhotoCollectionView.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class View: UIView {
    var totalRecords = 0
    var sourceArray = [FlickrURLs]()
    var photoController : Controller?

    @IBOutlet weak var collectionView: UICollectionView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(controller : Controller?) {
        self.photoController = controller
        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "PhotoCell")
        self.collectionView.register(UINib(nibName: "PhotoLoaderCell", bundle: nil), forCellWithReuseIdentifier: "PhotoLoaderCell")
        self.sourceArray = photoController?.getViewData() ?? [FlickrURLs]()
    }
    
    func loadNextPageData() {
        self.photoController?.nextPageAction()
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
            return self.collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoLoaderCell", for: indexPath)
        } else {
            return self.collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
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
        if indexPath.row == self.sourceArray.count {
            self.loadNextPageData()
        }
    }
    
}
