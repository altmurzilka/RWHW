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
    
    @IBOutlet weak var ColorName: UILabel!
    
    @IBOutlet weak var setColorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func RedValueChange(_ sender: UISlider) {
        RedLabel.text = "\(RedSlider.value.rounded())"
    }
    
    @IBAction func GreenValueChange(_ sender: UISlider) {
        GreenLabel.text = "\(GreenSlider.value.rounded())"
    }
    
    @IBAction func BlueValueChange(_ sender: UISlider) {
        BlueLabel.text = "\(BlueSlider.value.rounded())"
    }
    
    @IBAction func setColor(_ sender: UIButton) {
        
        var txtColor: UITextField?
        
        let alert = UIAlertController(title: "Color", message: "Please set the color name", preferredStyle: .alert)
        
        let setAction = UIAlertAction(title: "Set", style: .default) { (i) in
            if let clr = txtColor?.text {
                self.ColorName.text = "\(clr)"
                print("color name is: \(clr)")
            } else {
                print("No color")
            }
        }
        
        alert.addTextField { (i) in
            txtColor = i
            txtColor?.placeholder = "Enter your color"
        }
        
        alert.addAction(setAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
