//
//  ViewController.swift
//  MyJournal
//
//  Created by Ricardo Ruiz on 6/7/17.
//  Copyright © 2017 Ricardo Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "My Journal"
    }

    @IBAction func compose(_ sender: Any) {
        
        if let _compose = self.storyboard?.instantiateViewController(withIdentifier: "Compose") {
            self.navigationController?.pushViewController(_compose, animated: true)
        } else {
            print("The was a problem")
        }
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
        
        // Set Fields
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}












