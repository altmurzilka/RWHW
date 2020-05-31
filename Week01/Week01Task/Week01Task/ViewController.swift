//
//  ViewController.swift
//  Week01Task
//
//  Created by алтынпончик on 5/30/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert() {
        
        let alert = UIAlertController(title: "Name your color", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let action = UIAlertAction(title: "Submit", style: .default) { [unowned alert] _ in
            let answer = alert.textFields![0]
            // do something interesting with "answer" here
        }
        alert.addAction(action)

        present(alert, animated: true)
    }


}

