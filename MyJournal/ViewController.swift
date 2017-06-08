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

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostCell
        cell.imageview.transform.rotated(by: CGFloat(M_PI_2))
        // cell.imageview.image =
        // Set Fields
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}












