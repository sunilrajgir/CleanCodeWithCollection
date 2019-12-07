//
//  PhotoCollectionView.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    var photoController : PhotoController?
    func bind(controller : PhotoController) {
        
        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "PhotoCell")
        self.photoController = controller
    }

}

extension PhotoView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
    }
    
    
}
