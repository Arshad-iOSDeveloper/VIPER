//
//  LoginViewController.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

import UIKit

protocol LoginPresenterToViewProtocol: AnyObject {
    var presenter: LoginViewToPresenterProtocol? {get set}
}

class LoginViewController: UIViewController, LoginPresenterToViewProtocol {
    
    //MARK: Outlets
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var presenter: LoginViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtUsername.delegate = self
        txtPassword.delegate = self
    }
    
    //MARK: Action Button
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        print("username is ", txtUsername.text ?? "")
        print("password is ", txtPassword.text ?? "")
        LoginRouter().moveToUpdateLogin(vc: self, username: txtUsername.text ?? "", password: txtPassword.text ?? "")
    }
    
    
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == txtUsername)
        {
            txtUsername.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        }
        else if(textField == txtPassword)
        {
            txtPassword.resignFirstResponder()
        }
        return true
    }
}

extension LoginViewController: UpdateLoginProtocolDelegate{
    func getUpdatedLoginDetailsBack(userDetails: UserDetails) {
        txtUsername.text = userDetails.userName
        txtPassword.text = userDetails.password
    }
}
