//
//  UpdateLoginViewController.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

import UIKit

protocol UpdateLoginPresenterToViewProtocol: AnyObject {
    var presenter: UpdateLoginViewToPresenterProtocol? {get set}
    
    func update(with users: [User])
    func update(with error: String)
}

protocol UpdateLoginProtocolDelegate: AnyObject{
    func getUpdatedLoginDetailsBack(userDetails: UserDetails)
}

class UpdateLoginViewController: BaseViewController, UpdateLoginPresenterToViewProtocol {
    
    var presenter: UpdateLoginViewToPresenterProtocol?
    
    //MARK: Outlets
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assigning data coming from Presenter directly
        txtUsername.text = presenter?.userName
        txtPassword.text = presenter?.password
        
        //initially hide table view
        self.tblView.isHidden = true
    }
    
    //MARK: Action Button
    @IBAction func btnUpdateClicked(_ sender: UIButton) {
        //Send data back to login VC and pop back VC
        //sendDataBack()
        
        //Api call
        self.showActivityIndicator()
        presenter?.getUsersApi()
    }
    
    func sendDataBack(){
        print("username is ", txtUsername.text ?? "")
        print("password is ", txtPassword.text ?? "")
        presenter?.sendDataBackFromPresnter(updatedUserName: txtUsername.text ?? "", updatedPassword: txtPassword.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupTblView(){
        self.tblView.register(UINib(nibName: "UsersTVCell", bundle: nil), forCellReuseIdentifier: "UsersTVCell")
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.isHidden = false
        self.tblView.reloadData()
    }
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            print("user details are ", self.presenter?.usersList?[0].name ?? "", self.presenter?.usersList?[0].email ?? "")
            self.setupTblView()
            self.stopActivityIndicator()
        }
    }
    
    func update(with error: String) {
        self.stopActivityIndicator()
    }
    
}

extension UpdateLoginViewController : UITextFieldDelegate {
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

extension UpdateLoginViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.usersList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTVCell", for: indexPath) as? UsersTVCell else {return UITableViewCell()}
        let data = self.presenter?.usersList?[indexPath.row]
        cell.lblId.text = data?.id.description
        cell.lblUsername.text = data?.username
        cell.lblEmail.text = data?.email
        cell.lblCompanyName.text = data?.company.name
        return cell
    }
    
}
