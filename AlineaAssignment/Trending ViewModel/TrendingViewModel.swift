//
//  TrendingViewModel.swift
//  AlineaAssignment
//
//  Created by Neha on 25/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

struct TrendingModel {
    var sectionHeader: String
    var sectionData: [Data]
}

struct Data {
    var title: String
    var subTitle: String
    var ratings: String
    var ratingsColor: UIColor
    var image: UIImage?
}

protocol TrendingViewModel {
   func getDataForSection(_ section: Int) -> [Data]
    func getDataForSectionAt(_ indexPath: IndexPath) -> Data
    func getSections() -> [TrendingModel]
    func getSectionAt(_ seciton: Int) -> TrendingModel
    
}

class TrendingViewModelImp: TrendingViewModel {
    func getDataForSection(_ section: Int) -> [Data] {
        return sections[section].sectionData
    }
    
    func getDataForSectionAt(_ indexPath: IndexPath) -> Data {
        return sections[indexPath.section].sectionData[indexPath.row]
    }
    
    func getSections() -> [TrendingModel] {
        return sections
    }
    
    func getSectionAt(_ section: Int) -> TrendingModel {
        return sections[section]
    }
    
    init() {
        
        // Section 1
        let data_1_sec_1 = Data(title: Strings.medifast, subTitle: Strings.medi, ratings: "+50.78",ratingsColor: #colorLiteral(red: 0.9363988042, green: 0.407874614, blue: 0.4138176441, alpha: 1), image: .risk)
        let data_2_sec_1 = Data(title: Strings.pinterest, subTitle: Strings.pins, ratings: "-4.77",ratingsColor: #colorLiteral(red: 0.3849437237, green: 0.8610973358, blue: 0.7061507106, alpha: 1), image: .pinterest )
        let data_3_sec_1 = Data(title: Strings.slack, subTitle: Strings.work, ratings: "-5.99",ratingsColor: #colorLiteral(red: 0.9363988042, green: 0.407874614, blue: 0.4138176441, alpha: 1), image: .slack)
        let data_4_sec_1 = Data(title: Strings.evoqua, subTitle: Strings.aqua, ratings: "+5.99",ratingsColor: #colorLiteral(red: 0.3849437237, green: 0.8610973358, blue: 0.7061507106, alpha: 1), image: .drop)
        let data_1 = [data_1_sec_1, data_2_sec_1, data_3_sec_1, data_4_sec_1]
        let section_1 = TrendingModel(sectionHeader: Strings.gainers, sectionData: data_1)
        
        // Section 2
        let data_1_sec_2 = Data(title: Strings.slack, subTitle: Strings.work, ratings: "-5.99",ratingsColor: #colorLiteral(red: 0.9363988042, green: 0.407874614, blue: 0.4138176441, alpha: 1), image: .slack)
        let data_2_sec_2 = Data(title: Strings.evoqua, subTitle: Strings.aqua, ratings: "+5.99",ratingsColor: #colorLiteral(red: 0.3849437237, green: 0.8610973358, blue: 0.7061507106, alpha: 1), image: .drop)
        let data_2 = [data_1_sec_2, data_2_sec_2]
        let section_2 = TrendingModel(sectionHeader: Strings.sellers, sectionData: data_2)
        
        sections = [section_1, section_2]
    }
    
    private var sections = [TrendingModel]()
    
}
