//
//  ViewController.swift
//  Actions&Outlet
//
//  Created by Cheyenne Mowatt on 7/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func button(_ sender: UIButton) {
        if let newTitle = textField.text {
            label.text = newTitle
        }
    }

}

