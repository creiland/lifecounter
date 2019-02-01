//
//  SecondViewController.swift
//  lifecounter
//
//  Created by Conor Reiland on 1/29/19.
//  Copyright © 2019 Conor Reiland. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var strings :[String]?
    
    var count = 0
    
    @IBOutlet weak var stack: UIStackView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        for item in strings!{
            count += 1
            let label = UILabel(frame: CGRect(x:0, y:0, width: view.frame.width, height:view.frame.height))
            label.textAlignment = .center
            label.text = item
            stack.addArrangedSubview(label)
            
        }
    }

}

class MyTable: UITableViewController {
    
}
