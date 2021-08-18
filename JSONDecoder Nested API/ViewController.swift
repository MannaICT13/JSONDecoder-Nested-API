//
//  ViewController.swift
//  JSONDecoder Nested API
//
//  Created by Sharetrip-iOS on 17/08/2021.
//

import UIKit

class ViewController: UIViewController {

    var users = [Users]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONHandler.instance.setupJsonHandler { (users) in
            self.users = users
        }
        
    
      
    }


}

