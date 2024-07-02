//
//  UpdateLoginRouter.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

import Foundation
import UIKit

protocol UpdateLoginPresenterToRouterProtocol: AnyObject {
    static func openUpdateLoginView(vc: UIViewController?, username: String, password: String)
    
    var delegate: UpdateLoginProtocolDelegate? {get set}
    func sendUpdateLoginDetailsBack(userName: String, password: String)
}

class UpdateLoginRouter: UpdateLoginPresenterToRouterProtocol{
    weak var delegate: UpdateLoginProtocolDelegate?
    
    static func openUpdateLoginView(vc: UIViewController?, username: String, password: String) {
        let view: UIViewController & UpdateLoginPresenterToViewProtocol = UpdateLoginViewController()
        let interactor: UpdateLoginPresenterToInteractorProtocol = UpdateLoginInteractor()
        let presenter: UpdateLoginViewToPresenterProtocol & UpdateLoginInteractorToPresenterProtocol = UpdateLoginPresenter(userNameFromLogin: username, passwordFromLogin: password)
        let router: UpdateLoginPresenterToRouterProtocol = UpdateLoginRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        if let LoginVC = vc as? LoginViewController {
            router.delegate = LoginVC
        }
        vc?.navigationController?.pushViewController(view, animated: true)
    }
    
    func sendUpdateLoginDetailsBack(userName: String, password: String) {
        let userDetails = UserDetails(userName: userName, password: password)
        delegate?.getUpdatedLoginDetailsBack(userDetails: userDetails)
    }
}
