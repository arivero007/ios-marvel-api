//
//  CharactersViewModel.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation
import UIKit
import Alamofire


class CharactersViewModel: NSObject {

    private(set) var filteredCharacters : [Character] = [] {
        didSet {
            self.bindFilteredViewModelToController()
        }
    }
    
    private var characters : [Character]! {
        didSet {
            filteredCharacters = characters
        }
    }
    
    private(set) var loading : Bool = false {
        didSet {
            self.bindLoadingViewModelToController()
        }
    }
    
    private(set) var serviceError : AFError? {
        didSet {
            self.bindLoadingViewModelToController()
        }
    }
    
    var bindFilteredViewModelToController : (() -> ()) = {}
    var bindLoadingViewModelToController : (() -> ()) = {}
    var bindErrorViewModelToController : (() -> ()) = {}
    
    private lazy var apiCharacters: ApiGetCharactersProtocol = {
        return ApiCharactersService()
    }()

    
    //MARK: - WebService
    func getCharacters(){
        loading = true
        serviceError = nil
        apiCharacters.getAllCharacters(method: .get) { result in
            self.loading = false
            switch result {
            case .success(let response):
                self.characters = response.data.results
            case .failure(let e):
                self.serviceError = e
            }
        }
    }
    
    func applyTextFilter(text: String){
        if text == ""{
            filteredCharacters = characters
        }else{
            filteredCharacters = []
            for item in characters{
                if item.name.contains(text){
                    filteredCharacters.append(item)
                }
            }
        }
    }

}
