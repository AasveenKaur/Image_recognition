//
//  BaseViewController.swift
//  ImageRecognitionProject
//
//  Created by aasveen on 7/28/18.
//  Copyright © 2018 Aasveen. All rights reserved.
//

import UIKit
import AVKit
import Vision

class BaseViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Back_Button")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Back_Button")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain , target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = Color.beigeTextColor.value
        
        // Do any additional setup after loading the view.
    }
    
     func startCameraCapture() {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BaseViewController: UIImagePickerControllerDelegate {
    @IBAction func pickImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .savedPhotosAlbum
        present(pickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("couldn't load image from Photos")
        }
        
        //scene.image = image
    }
}

// MARK: - UINavigationControllerDelegate
extension BaseViewController: UINavigationControllerDelegate {
}
