//
//  CharacterDetailViewController.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import UIKit
import KRProgressHUD

class CharacterDetailViewController: UIViewController {
    
    lazy var characterDetailVM: CharacterDetailViewModel = {
        return CharacterDetailViewModel()
    }()
        
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLbl: UILocalizableLabel!
    @IBOutlet weak var descriptionTxt: UITextView!
    @IBOutlet weak var modifiedLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setBindings()
        characterDetailVM.getCharacterDetail()
    }
    
}

extension CharacterDetailViewController {
    
    private func setBindings(){
        characterDetailVM.bindCharacterViewModelToController = {
            self.fillCharacterData()
        }
        
        characterDetailVM.bindLoadingViewModelToController = {
            if self.characterDetailVM.loading {
                KRProgressHUD.show()
            }else{
                KRProgressHUD.dismiss()
            }
        }
        
        characterDetailVM.bindErrorViewModelToController = {
            if let error = self.characterDetailVM.serviceError{
                KRProgressHUD.dismiss {
                    self.showError(error.errorDescription)
                }
            }
        }
    }
    
    private func fillCharacterData(){
        guard let character = characterDetailVM.character else {return}
        titleLbl.text = character.name
        let imgPath = String.init(format: "%@.%@", character.thumbnail?.path ?? "", character.thumbnail?.type ?? "")
        if(imgPath != "."){
            image.load(url: URL.init(string: imgPath)!)
        }
        if character.description != "" {
            descriptionTxt.text = character.description
        }
        guard let date = character.modified else {return}
        modifiedLbl.text = date.parseDateShort
    }
}
