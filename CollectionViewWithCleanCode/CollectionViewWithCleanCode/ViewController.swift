//
//  ViewController.swift
//  CollectionViewWithCleanCode
//
//  Created by sunil.kumar1 on 12/7/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BtnAction(_ sender: Any) {
        let view = PhotoViewController(nibName: "PhotoViewController", bundle: nil)
        self.navigationController?.pushViewController(view, animated: true)
    }
    
}

