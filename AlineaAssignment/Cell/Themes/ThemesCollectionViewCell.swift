//
//  ThemesCollectionViewCell.swift
//  AlineaAssignment
//
//  Created by Neha on 25/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

class ThemesCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    static func cellIdentifier() -> String {
           return "ThemesCollectionViewCell"
       }
       
       static func nib() -> UINib {
           return UINib(nibName: "ThemesCollectionViewCell", bundle: nil)
       }
    
    fileprivate func setUpUI() {
        self.backgroundColor = .clear
        containerView.backgroundColor = #colorLiteral(red: 0.9808405042, green: 0.9844462276, blue: 0.9876640439, alpha: 1)
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        titleLbl.textColor = .black
        titleLbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    func configureCell(_ model: ThemesModel) {
        titleLbl.text = model.title
        imgView.image = model.image
    }

}
