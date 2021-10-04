//
//  CharacterDetailViewModel.swift
//  MarvelAPI
//
//  Created by AlexR on 4/10/21.
//

import Foundation
import UIKit
import Alamofire


class CharacterDetailViewModel: NSObject {
    
    var id: Int64?
    
    private(set) var character : Character! {
        didSet {
            self.bindCharacterViewModelToController()
        }
    }
    
    private(set) var loading : Bool = false {
        didSet {
            self.bindLoadingViewModelToController()
        }
    }
    
    private(set) var serviceError : AFError? {
        didSet {
            self.bindErrorViewModelToController()
        }
    }
    
    var bindCharacterViewModelToController : (() -> ()) = {}
    var bindLoadingViewModelToController : (() -> ()) = {}
    var bindErrorViewModelToController : (() -> ()) = {}
    
    private lazy var apiCharacterDetail: ApiCharacterDetailProtocol = {
        return ApiCharacterDetailService()
    }()

    
    //MARK: - WebService
    func getCharacterDetail(){
        loading = true
        serviceError = nil
        apiCharacterDetail.getCharacterDetail(id: id ?? 0, method: .get) { result in
            self.loading = false
            switch result {
            case .success(let characters):
                self.character = characters.data.results.first
            case .failure(let e):
                self.serviceError = e
            }
        }
    }

}
