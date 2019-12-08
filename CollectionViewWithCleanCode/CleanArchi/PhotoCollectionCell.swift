//
//  PhotoCell.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    var imageView : UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addImageView()
        // Initialization code
    }
    
    func addImageView(){
        self.imageView = UIImageView(frame: self.bounds)
        self.imageView?.backgroundColor = .red
        //self.addSubview(self.imageView!)
    }
    
    override func prepareForReuse() {
        self.imageView?.removeFromSuperview()
    }

}
