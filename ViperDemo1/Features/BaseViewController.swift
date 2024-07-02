//
//  BaseViewController.swift
//  ViperDemo1
//
//  Created by Apple on 01/09/22.
//

import UIKit

class BaseViewController: UIViewController {
        
    //Create Activity Indicator
    let myActivityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func showActivityIndicator(){
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
    }
    
    func stopActivityIndicator(){
        // Call stopAnimating() when need to stop activity indicator
        myActivityIndicator.stopAnimating()
        myActivityIndicator.removeFromSuperview()
    }
    
    
    
}
