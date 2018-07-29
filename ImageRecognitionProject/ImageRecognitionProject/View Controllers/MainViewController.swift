//
//  ViewController.swift
//  ImageRecognitionProject
//
//  Created by aasveen on 7/28/18.
//  Copyright © 2018 Aasveen. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var identifyFruitButton: UIButton!
    @IBOutlet weak var identifyShapeButton: UIButton!
    @IBOutlet weak var identifyFlowerButton: UIButton!
    @IBOutlet weak var identifyColorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("main_screen_title", comment: "")
        self.navigationController?.navigationBar.backgroundColor = Color.theme.value
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: myFont.theme.value, NSAttributedStringKey.foregroundColor: Color.beigeTextColor.value]
        self.navigationController?.navigationBar.barTintColor = Color.theme.value
        setupButtons()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - INITIAL SETUP FUNCTIONS
    func setupButtons() {
        identifyFruitButton.backgroundColor  = Color.fruitButtonColor.value
        identifyShapeButton.backgroundColor  = Color.shapeButtonColor.value
        identifyColorButton.backgroundColor  = Color.colorButtonColor.value
        identifyFlowerButton.backgroundColor = Color.flowerButtonColor.value
        
        identifyFruitButton.titleLabel?.font  = myFont.fruitButtonFont.value
        identifyShapeButton.titleLabel?.font  = myFont.shapeButtonFont.value
        identifyColorButton.titleLabel?.font  = myFont.colorButtonFont.value
        identifyFlowerButton.titleLabel?.font = myFont.flowerButtonFont.value
        
        identifyFruitButton.setTitleColor(Color.beigeTextColor.value, for: UIControlState())
        identifyShapeButton.setTitleColor(Color.darkTextColor.value, for: UIControlState())
        identifyColorButton.setTitleColor(Color.beigeTextColor.value, for: UIControlState())
        identifyFlowerButton.setTitleColor(Color.darkTextColor.value, for: UIControlState())
        
        
        
    }
    
}

