//
//  LoginRouter.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

import Foundation
import UIKit

protocol LoginPresenterToRouterProtocol: AnyObject {
    static func createLoginScreen() -> UIViewController
    
    func moveToUpdateLogin(vc: UIViewController?, username: String, password: String)
}

class LoginRouter: LoginPresenterToRouterProtocol{
    
    static func createLoginScreen() -> UIViewController {
        let view: UIViewController & LoginPresenterToViewProtocol = LoginViewController()
        
        let presenter: LoginViewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginPresenter()
        let interactor: LoginPresenterToInteractorProtocol = LoginInteractor()
        let router: LoginPresenterToRouterProtocol = LoginRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        return view
    }
    
    func moveToUpdateLogin(vc: UIViewController?, username: String, password: String) {
        UpdateLoginRouter.openUpdateLoginView(vc: vc, username: username, password: password)
    }
}
