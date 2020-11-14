//
//  InboxViewController.swift
//  HomeCreditTest
//
//  Created by Kevin Fachal on 12/11/20.
//

import UIKit

class InboxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    @IBAction func editAction(_ sender: Any) {
        if (self.tableView.isEditing) {
            editBtn.title = "Edit"
            self.tableView.setEditing(false, animated: true)
        } else {
            editBtn.title = "Done"
            self.tableView.setEditing(true, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readState.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inboxCell : InboxTableViewCell = tableView.dequeueReusableCell(withIdentifier: "inboxCell", for: indexPath) as! InboxTableViewCell
        
        if readState[indexPath.row] == false {
            inboxCell.readView.isHidden = false
            inboxCell.readView.image = UIImage(systemName: "circle.fill")
        }
        if readState[indexPath.row] == true {
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
        readState[indexPath.row] = true
        
        performSegue(withIdentifier: "toDetails", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            readState.remove(at: indexPath.row)
            fromValue.remove(at: indexPath.row)
            timeValue.remove(at: indexPath.row)
            subjectValue.remove(at: indexPath.row)
            contentValue.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if readState[indexPath.row] == true {
            let modifyAction = UIContextualAction(style: .normal, title:  "Unread", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                readState[indexPath.row] = false
                self.tableView.reloadData()
                success(true)
                 })
            modifyAction.image = UIImage(systemName: "envelope.badge.fill")
            modifyAction.backgroundColor = UIColor.systemBlue
            
            return UISwipeActionsConfiguration(actions: [modifyAction])
        } else {
            let modifyAction = UIContextualAction(style: .normal, title:  "Read", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                readState[indexPath.row] = true
                self.tableView.reloadData()
                success(true)
                 })
            modifyAction.image = UIImage(systemName: "envelope.open.fill")
            modifyAction.backgroundColor = UIColor.systemBlue
            
            return UISwipeActionsConfiguration(actions: [modifyAction])
        }
    }
    
    @IBAction func unwindToInbox(segue: UIStoryboardSegue) {
    }
    
}
