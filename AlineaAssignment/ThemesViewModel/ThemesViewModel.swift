//
//  ThemesViewModel.swift
//  AlineaAssignment
//
//  Created by Neha on 25/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

struct ThemesModel {
    var title: String
    var image: UIImage?
}

protocol ThemesViewModel {
    func getThemes() -> [ThemesModel]
    func getThemeAt(_ indextPath: IndexPath) -> ThemesModel
    
}

class ThemesViewModelImp: ThemesViewModel {
    func getThemes() -> [ThemesModel] {
        return themes
    }
    
    func getThemeAt(_ indextPath: IndexPath) -> ThemesModel {
        return themes[indextPath.row]
    }
    
    
    init() {
        let theme_1 = ThemesModel(title: Strings.theme_1, image: UIImage.female)
        let theme_2 = ThemesModel(title: Strings.theme_2, image: UIImage.go_green)
        let theme_3 = ThemesModel(title: Strings.theme_3, image: UIImage.female)
        let theme_4 = ThemesModel(title: Strings.theme_4, image: UIImage.go_green)
        let theme_5 = ThemesModel(title: Strings.theme_5, image: UIImage.female)
        let theme_6 = ThemesModel(title: Strings.theme_6, image: UIImage.go_green)
        let theme_7 = ThemesModel(title: Strings.theme_7, image: UIImage.female)
        let theme_8 = ThemesModel(title: Strings.theme_8, image: UIImage.go_green)
        
        themes = [theme_1, theme_2, theme_3, theme_4, theme_5, theme_6, theme_7, theme_8]
    }
    private var themes = [ThemesModel]()
    
}
