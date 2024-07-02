//
//  UpdateLoginInteractor.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

import Foundation

protocol UpdateLoginPresenterToInteractorProtocol: AnyObject {
    var presenter: UpdateLoginInteractorToPresenterProtocol? {get set}
    func getUsersApi()
}

class UpdateLoginInteractor: UpdateLoginPresenterToInteractorProtocol{
    var presenter: UpdateLoginInteractorToPresenterProtocol?
    
    func getUsersApi() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            do{
                let users = try JSONDecoder().decode(Users.self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(users))
            }
            catch{
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
            }
        }
        task.resume()
    }
}
