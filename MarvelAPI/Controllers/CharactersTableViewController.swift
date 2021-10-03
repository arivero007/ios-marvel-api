//
//  ViewController.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import UIKit

final class CharactersTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
        
    lazy private var charactersVM: CharactersViewModel = {
        return CharactersViewModel()
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        setBindings()
        charactersVM.getCharacters()
    }
        
    @IBAction func refreshCharacters(_ sender: UIRefreshControl) {
        charactersVM.getCharacters()
    }
    
    //MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let vc = segue.destination as? CharacterDetailViewController, let id = sender as? Int64 else{
//            return
//        }
//        vc.characterId = id
//    }
}

//MARK: - Class func

extension CharactersTableViewController{
    
    private func setBindings(){
        charactersVM.bindFilteredViewModelToController = {
            self.tableView.reloadData()
        }
        
        charactersVM.bindLoadingViewModelToController = {
            if !self.charactersVM.loading {
                self.refreshControl?.endRefreshing()
            }
        }
        
        charactersVM.bindErrorViewModelToController = {
            if let error = self.charactersVM.serviceError {
                self.showError(error.errorDescription)
            }
        }
    }

}

// MARK: - Table view data source

extension CharactersTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersVM.filteredCharacters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.className) as? CharactersTableViewCell else {
            return UITableViewCell()
        }
        
        cell.character = charactersVM.filteredCharacters[indexPath.item]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let characterId = charactersVM.filteredCharacters[indexPath.item].id
        
        performSegue(withIdentifier: "segueCharacter", sender: characterId)
    }
}

// MARK: - Search bar delegate

extension CharactersTableViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        charactersVM.applyTextFilter(text: searchText)
    }
}
