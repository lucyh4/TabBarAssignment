//
//  CategoryTableViewCell.swift
//  AlineaAssignment
//
//  Created by Neha on 25/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit
protocol CategoryDelegate: class {
    func didTapOnBtn(_ sender: CategoryTableViewCell)
}

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var button: UIButton!
    weak var delegate: CategoryDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        // Initialization code
    }
    
    static func cellIdentifier() -> String {
        return "CategoryTableViewCell"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryTableViewCell", bundle: nil)
    }
    fileprivate func setUpUI() {
        self.backgroundColor = .clear
        self.containerView.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        button.layer.cornerRadius =  button.frame.height / 2
       title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
       title.textColor = .white
    }
    
    func configureCell(_ categoryModel: CategoryModel) {
        title.text = categoryModel.title
        button.backgroundColor = categoryModel.color
        imgView.image = categoryModel.image
    }
    
    @IBAction func didTapOnBtn(_ sender: UIButton) {
        self.delegate?.didTapOnBtn(self)
    }
    
}
