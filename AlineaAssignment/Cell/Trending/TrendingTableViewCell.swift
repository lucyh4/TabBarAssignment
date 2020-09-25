//
//  TrendingTableViewCell.swift
//  AlineaAssignment
//
//  Created by Neha on 25/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var rightLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        setUpFontAndColor()
    }
    
    static func cellIdentifier() -> String {
        return "TrendingTableViewCell"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TrendingTableViewCell", bundle: nil)
    }
    
    fileprivate func setUpUI() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.containerView.backgroundColor = .clear
    }
    
    fileprivate func setUpFontAndColor() {
        titleLbl.textColor = .black
        titleLbl.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        subTitleLbl.textColor = .gray
        subTitleLbl.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        rightLbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        rightLbl.textColor = .white
        rightLbl.layer.cornerRadius = rightLbl.frame.height / 2
        rightLbl.layer.masksToBounds = true
        
    }
    
    func configureCell(_ sectionData: Data) {
        titleLbl.text = sectionData.title
        subTitleLbl.text = sectionData.subTitle
        rightLbl.text = sectionData.ratings
        rightLbl.backgroundColor = sectionData.ratingsColor
        imgView.image = sectionData.image
    }
    
}
