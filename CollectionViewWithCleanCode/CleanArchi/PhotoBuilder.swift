//
//  PhotoViewBuilder.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class PhotoBuilder {

    static func assembelModule() -> UIViewController {
        let view = PhotoViewController(nibName: "PhotoViewController", bundle: nil)
        return view
     }
}
