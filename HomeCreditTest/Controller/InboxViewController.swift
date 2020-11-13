//
//  InboxViewController.swift
//  HomeCreditTest
//
//  Created by Kevin Fachal on 12/11/20.
//

import UIKit

class InboxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readState.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inboxCell : InboxTableViewCell = tableView.dequeueReusableCell(withIdentifier: "inboxCell", for: indexPath) as! InboxTableViewCell
        
        if readState[indexPath.row] == false {
            inboxCell.readView.image = UIImage(systemName: "circle.fill")
        } else {
            inboxCell.readView.isHidden = true
        }
        
        inboxCell.fromtLabel.text = fromValue[indexPath.row]
        inboxCell.subjectLabel.text = subjectValue[indexPath.row]
        inboxCell.contentLabel.text = contentValue[indexPath.row]
        inboxCell.contentLabel.textColor = UIColor.gray
        
        return inboxCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
