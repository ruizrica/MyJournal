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
            //parseTest()
            loadData()
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
    
    @IBAction func refresh(_ sender: Any) {
        loadData()
    }
    
    func loadData() {
        
        // Set Class Name
        let query = PFQuery(className:"JournalEntries")
        query.findObjectsInBackground(block: {(objects : [PFObject]?, error: Error?) -> Void in
            if error == nil {
                
                if let returnedObjects = objects {
                    for object in returnedObjects {
                        print("FOUND OBJECT: \(object)")
                    }
                    self.currentDataSource = returnedObjects
                    self.tableview.reloadData()
                }
            }
        })
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostCell
        cell.title.text = post?["title"] as? String
        cell.textview.text = post?["body"] as? String
        cell.date.text = post?["date"] as? String
        cell.username.text = post?["username"] as? String
        // Load Image From Parse
        // https://stackoverflow.com/a/39926106
        if let userImageFile = post?["image"] as? PFFile {
            userImageFile.getDataInBackground(block: {
                (data: Data?, error: Error?) in
                
                if error == nil {
                    cell.imageview.image = UIImage(data:data!)
                }
            })
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}












