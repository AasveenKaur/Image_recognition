//
//  FruitViewController.swift
//  ImageRecognitionProject
//
//  Created by aasveen on 7/28/18.
//  Copyright © 2018 Aasveen. All rights reserved.
//

import UIKit
import AVKit
import Vision

class FruitViewController: BaseViewController {
    let identifierLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("fruit_screen_title", comment: "")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        startCameraCapture()
        setupIdentifierConfidenceLabel()
    }
    
    fileprivate func setupIdentifierConfidenceLabel() {
        view.addSubview(identifierLabel)
        identifierLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        identifierLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        identifierLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        identifierLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        //        print("Camera was able to capture a frame:", Date())
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // !!!Important
        // make sure to go download the models at https://developer.apple.com/machine-learning/ scroll to the bottom
        guard let model = try? VNCoreMLModel(for: FruitDetector().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            //perhaps check the err
            
            //            print(finishedReq.results)
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            
            DispatchQueue.main.async {
                self.identifierLabel.text = "\(firstObservation.identifier) \(firstObservation.confidence * 100)"
            }
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
