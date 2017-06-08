//
//  ViewController.swift
//  MyJournal
//
//  Created by Ricardo Ruiz on 6/7/17.
//  Copyright © 2017 Ricardo Ruiz. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // IBOutlets
    @IBOutlet weak var tableview: UITableView!
    
    // Local Constants & Variables
    var currentDataSource : [PFObject?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        defer {
            parseTest()
        }
        
        self.title = "My Journal"
    }

    @IBAction func compose(_ sender: Any) {
        
        if let _compose = self.storyboard?.instantiateViewController(withIdentifier: "Compose") {
            self.navigationController?.pushViewController(_compose, animated: true)
        } else {
            print("The was a problem")
        }
    }
    
    func loadData() -> [PFObject?] {
        
        // Set Class Name
        let query = PFQuery(className:"JournalEntries")
        query.findObjectsInBackground(block: {(objects : [PFObject]?, error: Error?) -> Void in
            if error == nil {
                
                if let returnedObjects = objects {
                    for object in returnedObjects {
                        print("FOUND OBJECT: \(object)")
                    }
                    self.currentDataSource = returnedObjects
                }
            }
        })
        
        return currentDataSource
    }
    
    func parseTest() {
        
        // REMINDER: Discuss Block Structure
        
        // Set Class Name
        let query = PFQuery(className:"JournalEntries")
        
        // CRUD - READ ONE
        // - - - - - - - - - - - - - - - - - - - - - - -
        // WORKING
//        query.getObjectInBackground(withId: "UmOtZWykAu", block: {(object : PFObject?, parseError : Error?) -> Void in
//            if parseError == nil && object != nil {
//                
//                if let returnedObject = object {
//                    print(returnedObject)
//                }
//            } else {
//                
//                if let returnedError = parseError {
//                    print(returnedError)
//                }
//            }
//        })

        // CRUD - READ ALL
        // - - - - - - - - - - - - - - - - - - - - - - -
        // WORKING

        query.findObjectsInBackground(block: {(objects : [PFObject]?, error: Error?) -> Void in
            if error == nil {
                
                for object in objects! {
                    print("FOUND OBJECT: \(object)")
                }
            }
        })
    }

    
//MARK: TableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Parse Object
        let post = currentDataSource[indexPath.row]
        
        //TODO: FIX IMAGE LOAD
        
        
//        let userImageFile = post?["image"] as! PFFile
//        userImageFile.getDataInBackground(block: {(imageData: NSData?, error: Error?) -> Void in
//        
//        })
//        userImageFile.getDataInBackgroundWithBlock {(imageData: NSData?, error: NSError?) -> Void in
//            if error == nil {
//                if let imageData = imageData {
//                    let image = UIImage(data:imageData)
//                }
//            }
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostCell
        cell.title.text = post?["title"] as? String
        cell.textview.text = post?["body"] as? String
        cell.date.text = post?["date"] as? String
        cell.username.text = post?["username"] as? String
        
        
//        cell.imageview.transform.rotated(by: CGFloat(M_PI_2))
        // cell.imageview.image =
        // Set Fields
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}












