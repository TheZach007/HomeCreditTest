//
//  ViewController.swift
//  HomeCreditTest
//
//  Created by Kevin Fachal on 12/11/20.
//

import UIKit

class EmailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let segueMover = ["toInbox"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emailCell : EmailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath) as! EmailTableViewCell
        
        emailCell.iconView.image = UIImage(systemName: menuImage[indexPath.row])
        emailCell.menuLabel.text = menuName[indexPath.row]
        
        return emailCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: segueMover[indexPath.row], sender: self)
    }

    @IBAction func unwindToEmail(segue: UIStoryboardSegue) {
    }
}

