//
//  UpdateLoginPresenter.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

import Foundation

protocol UpdateLoginViewToPresenterProtocol: AnyObject {
    var view: UpdateLoginPresenterToViewProtocol? {get set}
    var interactor: UpdateLoginPresenterToInteractorProtocol? {get set}
    var router: UpdateLoginPresenterToRouterProtocol? {get set}
    
    var userName: String? {get set}
    var password: String? {get set}
    var usersList: [User]? {get set}
    
    func sendDataBackFromPresnter(updatedUserName: String, updatedPassword: String)
    
    func getUsersApi()
}

protocol UpdateLoginInteractorToPresenterProtocol: AnyObject {
    func interactorDidFetchUsers(with result:Result<[User], Error>)
}

class UpdateLoginPresenter: UpdateLoginViewToPresenterProtocol{
    weak var view: UpdateLoginPresenterToViewProtocol?
    var interactor: UpdateLoginPresenterToInteractorProtocol?
    var router: UpdateLoginPresenterToRouterProtocol?
    
    var userName: String?
    var password: String?
    var usersList: [User]?
    
    init(userNameFromLogin: String, passwordFromLogin: String) {
        userName = userNameFromLogin
        password = passwordFromLogin
    }
    
    func sendDataBackFromPresnter(updatedUserName: String, updatedPassword: String){
        router?.sendUpdateLoginDetailsBack(userName: updatedUserName, password: updatedPassword)
    }
    
    func getUsersApi(){
        interactor?.getUsersApi()
    }
    
    func interactorDidFetchUsers(with result: Result<Users, Error>) {
        switch result{
        case .success(let users):
            self.usersList = users
            view?.update(with: users)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
}

extension UpdateLoginPresenter: UpdateLoginInteractorToPresenterProtocol{
    
}

