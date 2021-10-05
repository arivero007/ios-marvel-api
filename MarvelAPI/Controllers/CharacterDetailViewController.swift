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
    @IBOutlet weak var linkLbl: UILocalizableLabel!
    @IBOutlet weak var hiperLinkLbl: UILabel!
    @IBOutlet weak var comicsLbl: UILocalizableLabel!
    @IBOutlet weak var comicsNumberLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addLinkTapGesture()
        setBindings()
        characterDetailVM.getCharacterDetail()
    }
    
    private func addLinkTapGesture(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        hiperLinkLbl.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapAction() {
        guard let link = hiperLinkLbl.text else {return}
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
}

//MARK: - Class func
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
        
        if let link = character.urls?.first?.url {
            hiperLinkLbl.text = link
        }
        
        if let comicAvailable = character.comics?.available {
            comicsNumberLbl.text = String(comicAvailable)
        }
        
        guard let date = character.modified else {return}
        modifiedLbl.text = "detail_last_update".localized + " " + date.parseDateShort
    }
}
