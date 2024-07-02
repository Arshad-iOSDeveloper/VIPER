//
//  LoginInteractor.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

import Foundation

//Api Call
//Ref Presenter

protocol LoginPresenterToInteractorProtocol: AnyObject {
    var presenter: LoginInteractorToPresenterProtocol? {get set}
}

class LoginInteractor: LoginPresenterToInteractorProtocol{
    var presenter: LoginInteractorToPresenterProtocol?

}
