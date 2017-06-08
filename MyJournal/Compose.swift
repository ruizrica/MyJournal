//
//  Compose.swift
//  MyJournal
//
//  Created by Ricardo Ruiz on 6/7/17.
//  Copyright © 2017 Ricardo Ruiz. All rights reserved.
//

import UIKit
import CoreLocation

class Compose: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {

    // OUTLETS
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var imageview: UIImageView!
    
    // Local Properties
    var picker = UIImagePickerController()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Compose"
        
        // Picker Delegate
        picker.delegate = self
        
        // Core Location Setup
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    @IBAction func capturePhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
        } else {
            print("No Camera Present")
            
            let alert = UIAlertController(title: "No Camera", message: "Sorry This Device Has No Camera", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func captureLocation(_ sender: Any) {
        
        
    }

    //MARK: - Picker Delegates
    //
    // CAREFUL AUTOCOMPLETE IS INCORRECT
    // source: https://stackoverflow.com/a/40296083
    
    // GIVE EXTRA TIME TO COMPLETE THIS ********
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //var tempImage:UIImage = editingInfo[UIImagePickerControllerOriginalImage] as UIImage
            imageview.image = image
            print("IN DELEGATE")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    

}