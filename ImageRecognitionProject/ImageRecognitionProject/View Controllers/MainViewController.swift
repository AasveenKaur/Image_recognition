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
        identifyFruitButton.backgroundColor  = Color.flowerButtonColor.value
        identifyFruitButton.titleLabel?.font  = myFont.fruitButtonFont.value
        identifyFruitButton.setTitleColor(Color.beigeTextColor.value, for: UIControlState())
       
      
        
        
        
    }
    
}

