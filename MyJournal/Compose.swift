//
//  Compose.swift
//  MyJournal
//
//  Created by Ricardo Ruiz on 6/7/17.
//  Copyright © 2017 Ricardo Ruiz. All rights reserved.
//

import UIKit
import CoreLocation
import Parse

class Compose: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {

    // OUTLETS
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UITextField!
    
    // Local Properties
    var picker = UIImagePickerController()
    let locationManager = CLLocationManager()
    // Add UIImage var
    var imageToBeSaved : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defer {
            // Parse Test
            // parseTest()
        }
        
        // Title
        self.title = "Compose"
        
        // Picker Delegate
        picker.delegate = self
        
        // Core Location Setup
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Save Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(writeToParse))
        
        // Title Become First Responder
        titleLabel.becomeFirstResponder()
        
        // Offset Text Position
        textview.setContentOffset(CGPoint.zero, animated: false)

    }
    
    @IBAction func capturePhoto(_ sender: Any) {
        
        titleLabel.resignFirstResponder()
        textview.resignFirstResponder()
        
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
        
        titleLabel.resignFirstResponder()
        textview.resignFirstResponder()
    }
    
    func parseTest() {
        
        // Journal Entry
        let entry = PFObject(className:"JournalEntries")
        
        // Image
        if let imageData = UIImagePNGRepresentation(imageToBeSaved!) {
            let imageFile = PFFile(name:"image.jpg", data:imageData)
            entry["image"] = imageFile
        } else {
            print("Sumting Wong")
        }
    
        entry["title"] = "PICTURE SAMPLE"
        entry["body"] = "This is a test message"
        entry["username"] = "RICARDO"
        entry["date"] = "06152017"
        entry.saveInBackground { (success, error) in
            if success {
                print("FINISHED")
            }
            
            if (error != nil) {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    func writeToParse() {
        
        // Journal Entry
        let entry = PFObject(className:"JournalEntries")
        
        // Image
        // UIImageJPEG returns NSDATA
        if let imageData = UIImageJPEGRepresentation(imageToBeSaved!, 1.0) {
            let imageFile = PFFile(name:"image.jpg", data:imageData)
            entry["image"] = imageFile
        } else {
            print("Something Wrong")
        }
        
        // Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy @ h:mm a"
        
        entry["title"] = titleLabel.text
        entry["body"] = textview.text
        entry["username"] = "RICARDO"
        entry["date"] = dateFormatter.string(from: Date())
        entry.saveInBackground { (success, error) in
            if success {
                print("FINISHED")
            }
            if (error != nil) {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }

    //MARK: - Picker Delegates
    //
    // CAREFUL AUTOCOMPLETE IS INCORRECT
    // source: https://stackoverflow.com/a/40296083
    
    // GIVE EXTRA TIME TO COMPLETE THIS ********
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // COMPRESS IMAGE
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {

            // Compress Image Going Up
            imageToBeSaved = UIImage.init(data:UIImageJPEGRepresentation(image, 0.7)!)
            imageview.image = imageToBeSaved
        
            print("IN DELEGATE")
            //self.writeToParse()
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    //MARK: - Image Transform
    
//    func imageTransform(image : UIImage) -> UIImage {
//        
//        
//        
//        
//        return
//    }
    
}
