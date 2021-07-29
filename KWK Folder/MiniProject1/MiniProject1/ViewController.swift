//
//  ViewController.swift
//  MiniProject1
//
//  Created by Cheyenne Mowatt on 7/28/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var fall: UILabel!
    
    @IBOutlet weak var smoothies: UILabel!
    
    @IBOutlet weak var pool: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fall.isHidden = true
        smoothies.isHidden = true
        pool.isHidden = true
    }
  
    @IBAction func reveal(_ sender: UIButton) {
        fall.isHidden = false
        smoothies.isHidden = false
        pool.isHidden = false
    }
    
}

