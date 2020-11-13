//
//  InboxTableViewCell.swift
//  HomeCreditTest
//
//  Created by Kevin Fachal on 12/11/20.
//

import UIKit

class InboxTableViewCell: UITableViewCell {
    
    @IBOutlet weak var readView: UIImageView!
    @IBOutlet weak var fromtLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
