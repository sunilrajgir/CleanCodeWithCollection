//
//  PhotoCell.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    func fetchImage(imageModel: FlickrURLs) {
        ImageDownloader.shared.downloadImage(url:"https://farm66.staticflickr.com/65535/49182368667_06d70acb07.jpg") {[weak self] (image, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
                
            }
        }
    }

}
