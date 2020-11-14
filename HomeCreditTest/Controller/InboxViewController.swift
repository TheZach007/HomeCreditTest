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
        inboxCell.timeLabel.text = timeValue[indexPath.row]
        inboxCell.timeLabel.textColor = UIColor.gray
        inboxCell.contentLabel.text = contentValue[indexPath.row]
        inboxCell.contentLabel.textColor = UIColor.gray
        
        return inboxCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        UserDefaults.standard.set(fromValue[indexPath.row], forKey: "fromData")
        UserDefaults.standard.set(timeValue[indexPath.row], forKey: "timeData")
        UserDefaults.standard.set(subjectValue[indexPath.row], forKey: "subjectData")
        UserDefaults.standard.set(contentValue[indexPath.row], forKey: "contentData")
        
        performSegue(withIdentifier: "toDetails", sender: indexPath.row)
    }
    
    @IBAction func unwindToInbox(segue: UIStoryboardSegue) {
    }
    
}
