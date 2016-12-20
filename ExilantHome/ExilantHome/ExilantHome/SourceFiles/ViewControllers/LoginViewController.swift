//
//  ViewController.swift
//  ExilantHome
//
//  Created by medidi vv satyanarayana murty on 20/12/16.
//  Copyright © 2016 Medidi  V V  Satyanarayana Murty. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(userName)
        configure(password)
        userName.becomeFirstResponder()
        userName.addTarget(self, action:#selector(LoginViewController.textDidChange(text:)) , for: UIControlEvents.editingChanged)
        userName.delegate = self
        password.delegate = self
        password.addTarget(self, action:#selector(LoginViewController.textDidChange(text:)) , for: UIControlEvents.editingChanged)
    }
    
    /*
     
     - whenever text changes in username or password notifies to this function.
     - Enables login button true or false according to validation.
     
     */
    
    public func textDidChange(text:UITextField) {
        
        guard let name = userName.text , name.hasSuffix("@exilant.com"),
            let pwd = password.text , pwd.characters.count > 6 else {
                
                login.isEnabled =  false
                login.alpha = 0.5
                
                return
        }
        
        login.isEnabled =  true
        login.alpha = 1
    }
    
    
    @IBAction func loginUser(_ sender: UIButton) {
        // service to check username and password if true move to nextview controller else show alert
        
        performSegue(withIdentifier: "viewAllApps", sender:self)
    }
    
    private func configure(_ view: UIView) {
        
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor(colorLiteralRed: 32/250, green: 115/250, blue: 176/250, alpha: 1).cgColor
        view.layer.borderWidth = 1
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
