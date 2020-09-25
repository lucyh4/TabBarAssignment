//
//  TrendingTableViewHeader.swift
//  AlineaAssignment
//
//  Created by Neha on 25/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

class TrendingTableViewHeader: UIView {
    
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpFontAndColor()
    }
    
    static func loadView() -> TrendingTableViewHeader {
        return Bundle.main.loadNibNamed("TrendingTableViewHeader", owner: self, options: nil)?.first as! TrendingTableViewHeader
    }
    
    func setUpUI(_ model: TrendingModel) {
        titleLbl.text = model.sectionHeader
    }
    
    fileprivate func setUpFontAndColor() {
         titleLbl.textColor = .black
        titleLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
         self.backgroundColor = .clear
    }
    
}
