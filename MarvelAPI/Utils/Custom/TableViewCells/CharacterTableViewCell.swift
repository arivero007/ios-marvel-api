//
//  CharacterTableViewCell.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    
    var character: Character? {
        didSet{
            nameLbl.text = character?.name
        }
    }
    
    @IBOutlet private weak var nameLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
