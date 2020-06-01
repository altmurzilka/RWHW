//
//  SplashViewController.swift
//  Week01Task
//
//  Created by алтынпончик on 6/2/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {


    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setLoader()
    }
    
    private func setLoader() {
        indicator.color = UIColor(named: "white")
        indicator.startAnimating()
    }

}
