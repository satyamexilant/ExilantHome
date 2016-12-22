//
//  MailViewController.swift
//  ExilantHome
//
//  Created by medidi vv satyanarayana murty on 20/12/16.
//  Copyright © 2016 Medidi  V V  Satyanarayana Murty. All rights reserved.
//

import UIKit

class MailViewController: UIViewController,UIWebViewDelegate,UITabBarDelegate {
    
    //MARK:-Properties
    
    @IBOutlet var mailindicator: UIActivityIndicatorView!
    
    @IBOutlet var mailWebView: UIWebView!
    
    @IBOutlet var tabbar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        
        mailWebView.delegate = self
        tabbar.delegate = self
        
        
        mailindicator.startAnimating()
        mailindicator.hidesWhenStopped = true

        
    }
    //MARK:- WebView Delegate method
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        mailindicator.stopAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //MARK:- TabBar Item Actions
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
     
        switch item.tag {
        case 0:
            let url = NSURL(string: "https://mail.exilant.com/#1")
            let urlRequest = NSURLRequest(url: url! as URL)
            mailWebView.loadRequest(urlRequest as URLRequest)
            self.navigationItem.title = "Mail"
        case 1:
            let url = NSURL(string: "https://exis.exilant.com/SSO/")
            let urlRequest = NSURLRequest(url: url! as URL)
            mailWebView.loadRequest(urlRequest as URLRequest)
            self.navigationItem.title = "Time"
        case 2:
            let url = NSURL(string: "")
            let urlRequest = NSURLRequest(url: url! as URL)
            mailWebView.loadRequest(urlRequest as URLRequest)
            self.navigationItem.title = "Who"
        case 3:
            let url = NSURL(string: "")
            let urlRequest = NSURLRequest(url: url! as URL)
            mailWebView.loadRequest(urlRequest as URLRequest)
            self.navigationItem.title = "History"

           
        case 4:
            let url = NSURL(string: "")
            let urlRequest = NSURLRequest(url: url! as URL)
            mailWebView.loadRequest(urlRequest as URLRequest)
            self.navigationItem.title = "More"
        default:
            let url = NSURL(string: "")
            let urlRequest = NSURLRequest(url: url! as URL)
            mailWebView.loadRequest(urlRequest as URLRequest)
            
        }
    }
    //MARK:-logout Action
    
    @IBAction func logout(_ sender: AnyObject) {
        let viewController:UIViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Login") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
}
    

