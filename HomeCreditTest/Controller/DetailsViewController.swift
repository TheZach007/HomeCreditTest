//
//  DetailsViewController.swift
//  HomeCreditTest
//
//  Created by Kevin Fachal on 14/11/20.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var initialView: UIView!
    @IBOutlet weak var initialLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialView.layer.cornerRadius = initialView.frame.height/2
        
        loadData()
    }
    
    func loadData() {
        let initials = UserDefaults.standard.string(forKey: "fromData")!.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
        initialLabel.text = initials
        
        fromLabel.text = UserDefaults.standard.string(forKey: "fromData")!
        timeLabel.text = UserDefaults.standard.string(forKey: "timeData")!
        subjectLabel.text = UserDefaults.standard.string(forKey: "subjectData")!
        contentTextView.text = UserDefaults.standard.string(forKey: "contentData")!
        
    }

}
