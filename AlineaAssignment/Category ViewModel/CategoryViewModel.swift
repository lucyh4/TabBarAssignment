//
//  CategoryViewModel.swift
//  AlineaAssignment
//
//  Created by Neha on 25/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//


import UIKit

struct CategoryModel {
    var title: String
    var image: UIImage?
    var color: UIColor
}

protocol CategoryViewModel {
    func getCategories() -> [CategoryModel]
    func getCategoryAt(_ indextPath: IndexPath) -> CategoryModel
    
}

class CategoryViewModelImp: CategoryViewModel {
    func getCategories() -> [CategoryModel] {
        return categories
    }
    
    func getCategoryAt(_ indextPath: IndexPath) -> CategoryModel {
        return categories[indextPath.row]
    }
    
    init() {
        let category_1 = CategoryModel(title: Strings.stocks, image: UIImage.risk, color: #colorLiteral(red: 0.6486954093, green: 0.6425064206, blue: 0.9758914113, alpha: 1))
        let category_2 = CategoryModel(title: Strings.etfs, image: UIImage.risk, color: #colorLiteral(red: 0.3074962497, green: 0.3094292581, blue: 0.810193181, alpha: 1))
        let category_3 = CategoryModel(title: Strings.crypto, image: UIImage.risk, color: #colorLiteral(red: 0.9843137255, green: 0.8431372549, blue: 0.2901960784, alpha: 1))
        
        categories = [category_1, category_2, category_3]
        
    }
    private var categories = [CategoryModel]()
    
}
