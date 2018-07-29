//
//  BaseViewController.swift
//  ImageRecognitionProject
//
//  Created by aasveen on 7/28/18.
//  Copyright © 2018 Aasveen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Back_Button")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Back_Button")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain , target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = Color.beigeTextColor.value
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
