//
//  LoginPresenter.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

import Foundation
//Ref View, Interactor, Router

protocol LoginViewToPresenterProtocol: AnyObject {
    var view: LoginPresenterToViewProtocol? {get set}
    var interactor: LoginPresenterToInteractorProtocol? {get set}
    var router: LoginPresenterToRouterProtocol? {get set}
    
}

protocol LoginInteractorToPresenterProtocol:AnyObject  {
    
}

class LoginPresenter: LoginViewToPresenterProtocol, LoginInteractorToPresenterProtocol{
    
    var interactor: LoginPresenterToInteractorProtocol?
    var router: LoginPresenterToRouterProtocol?
    var view: LoginPresenterToViewProtocol?
    
}
