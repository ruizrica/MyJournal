//
//  PostCell.swift
//  MyJournal
//
//  Created by Ricardo Ruiz on 6/7/17.
//  Copyright © 2017 Ricardo Ruiz. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textview: UITextView!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
