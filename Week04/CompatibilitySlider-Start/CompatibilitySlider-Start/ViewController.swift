//
//  ViewController.swift
//  CompatibilitySlider-Start
//
//  Created by Jay Strawn on 6/16/20.
//  Copyright © 2020 Jay Strawn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var compatibilityItemLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var questionLabel: UILabel!
    
    var compatibilityItems = ["God of War III", "The Last of Us Part II", "The Legend of Zelda: Breath of the Wild", "The Witcher 3: Wild Hunt"] // Add more!
    var currentItemIndex = 0
    
    var person1 = Person(id: 1, items: [:])
    var person2 = Person(id: 2, items: [:])
    var currentPerson: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCompatibilityItems()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sender.setValue(round(sender.value), animated: true)
    }
    
    @IBAction func didPressNextItemButton(_ sender: Any) {
        let currentItem = compatibilityItems[currentItemIndex]
        currentPerson?.items.updateValue(slider.value, forKey: currentItem)
        if currentItemIndex + 1 < compatibilityItems.count {
            currentItemIndex += 1
            updateView()
        }
        else {
            if currentPerson == person1 {
                currentPerson = person2
                currentItemIndex = 0
                updateView()
            } else {
                showResults(score: calculateCompatibility())
            }
        }
    }
    
    func setupCurrentPerson() {
        guard currentPerson != nil else { return }
        questionLabel.text = "Player \(currentPerson!.id), what do you think about ..."
    }
    
    func updateView() {
        setupCurrentPerson()
        compatibilityItemLabel.text = compatibilityItems[currentItemIndex]
        slider.value = 2.5
    }
    
    func showResults(score: String) {
        let alert = UIAlertController(title: "Results:", message: "You two are \(score) compatible.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.setCompatibilityItems()
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setCompatibilityItems() {
        currentItemIndex = 0
        person1.items = [:]
        person2.items = [:]
        currentPerson = person1
        updateView()
    }
    
    func calculateCompatibility() -> String {
        // If diff 0.0 is 100% and 5.0 is 0%, calculate match percentage
        var percentagesForAllItems: [Double] = []
        
        for (key, person1Rating) in person1.items {
            let person2Rating = person2.items[key] ?? 0
            let difference = abs(person1Rating - person2Rating)/5.0
            percentagesForAllItems.append(Double(difference))
        }
        
        let sumOfAllPercentages = percentagesForAllItems.reduce(0, +)
        let matchPercentage = sumOfAllPercentages/Double(compatibilityItems.count)
        print(matchPercentage, "%")
        let matchString = 100 - (matchPercentage * 100).rounded()
        return "\(matchString)%"
    }
}

