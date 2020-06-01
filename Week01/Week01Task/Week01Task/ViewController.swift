//
//  ViewController.swift
//  Week01Task
//
//  Created by алтынпончик on 5/30/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    
    @IBOutlet weak var RedLabel: UILabel!
    @IBOutlet weak var GreenLabel: UILabel!
    @IBOutlet weak var BlueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func RedValueChange(_ sender: Any) {
        RedLabel.text = "\(RedSlider.value)"
    }
    
    @IBAction func GreenValueChange(_ sender: Any) {
        GreenLabel.text = "\(GreenSlider.value)"
    }
    
    @IBAction func BlueValueChange(_ sender: Any) {
        BlueLabel.text = "\(BlueSlider.value)"
    }
    
}

