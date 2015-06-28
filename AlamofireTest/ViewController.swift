//
//  ViewController.swift
//  AlamofireTest
//
//  Created by Tyler Hughes on 6/28/15.
//  Copyright (c) 2015 Tyler Hughes. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let apiRoot = "http://hands-staging.kintla.io/api"
    var currentUser: NSJSONSerialization?

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSubmit(sender: AnyObject) {
        login(usernameInput.text, password: passwordInput.text)
    }
    
    func login(username: String, password: String) {
        let params = [
            "username": username,
            "password": password
        ]
        Alamofire
            .request(.POST, "\(apiRoot)/authenticate", parameters: params, encoding: .JSON)
            .responseJSON(options: .AllowFragments, completionHandler: {
                (req, res, JSON, error) in
            
                println(req)
                println(res)
                println(JSON)
                println(error)
            })
    }


}

