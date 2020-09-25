//
//  MoreViewController.swift
//  ThirdTaskNavigationControl
//
//  Created by Neha on 18/07/20.
//  Copyright © 2020 Neha. All rights reserved.
//

enum button {
    case category
    case trending
}

import UIKit
class ExploreTabViewController: UIViewController {
    private let subView = UIView()
    private let categoryButton = UIButton()
    private let themesButton = UIButton()
    private let trendingButton = UIButton()
    private let stackView = UIStackView()
    private var tableViewType: button?
    private let tableView = UITableView()
    private var collectionView: UICollectionView?
    
    private let trendingViewModel: TrendingViewModel = TrendingViewModelImp()
    private let categoryViewModel: CategoryViewModel = CategoryViewModelImp()
    private let themeViewModel: ThemesViewModel = ThemesViewModelImp()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpStackView()
        setUpIntialBtn()
    }
    
    fileprivate func setUpView() {
        self.title = Strings.explore
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.sort, style: .done, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Bell", style: .plain, target: nil, action: nil)
        subView.frame = CGRect(x: 0, y: 88, width: self.view.frame.width , height: 50)
        self.view.addSubview(subView)
    }
    
    fileprivate func setUpIntialBtn() {
        trendingButton.setTitleColor(.purple, for: .normal)
        themesButton.setTitleColor(.black, for: .normal)
              categoryButton.setTitleColor(.black, for: .normal)
              self.tableView.removeFromSuperview()
              self.collectionView?.removeFromSuperview()
              tableViewType = .trending
              setUpTableView()
              tableView.reloadData()
    }
    
    fileprivate func setUpStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        setUpCategoryBtn()
        setUpThemesBtn()
        setUpTrendingBtn()
        stackView.addArrangedSubview(categoryButton)
        stackView.addArrangedSubview(themesButton)
        stackView.addArrangedSubview(trendingButton)
        subView.addSubview(stackView)
        setUpStackViewConstraints()
    }
    
    fileprivate func setUpTableView() {
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TrendingTableViewCell.nib(), forCellReuseIdentifier: TrendingTableViewCell.cellIdentifier())
        tableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.cellIdentifier())
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        setUpConstraintsForTableView()
    }
    
    fileprivate func setUpCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        if let collectionView = collectionView {
            collectionView.backgroundColor = .white
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(ThemesCollectionViewCell.nib(), forCellWithReuseIdentifier: ThemesCollectionViewCell.cellIdentifier())
            view.addSubview(collectionView)
            setUpConstraintsForCollectionView()
        }
    }
    
    fileprivate func setUpConstraintsForCollectionView() {
        if let collectionView = collectionView {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
            collectionView.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 0).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        }
    }
    
    fileprivate func setUpConstraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setUpStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: subView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setUpCategoryBtn() {
        categoryButton.backgroundColor = .white
        categoryButton.setTitleColor(.black, for: .normal)
        categoryButton.setTitle("Category", for: .normal)
        categoryButton.addTarget(self, action: #selector(moveToCategory(_ :)), for: .touchUpInside)
        
    }
    
    fileprivate func setUpThemesBtn() {
        themesButton.backgroundColor = .white
        themesButton.setTitleColor(.black, for: .normal)
        themesButton.setTitle("Themes", for: .normal)
        themesButton.addTarget(self, action: #selector(moveToThemes(_ :)), for: .touchUpInside)
        
    }
    
    fileprivate func setUpTrendingBtn() {
        trendingButton.backgroundColor = .white
        trendingButton.setTitleColor(.black, for: .normal)
        trendingButton.setTitle("Trending", for: .normal)
        trendingButton.addTarget(self, action: #selector(moveToTrending(_ :)), for: .touchUpInside)
        
    }
    
    @objc func moveToCategory(_ sender: UIButton) {
        sender.setTitleColor(.purple, for: .normal)
        themesButton.setTitleColor(.black, for: .normal)
        trendingButton.setTitleColor(.black, for: .normal)
        self.tableView.removeFromSuperview()
        self.collectionView?.removeFromSuperview()
        tableViewType = .category
        setUpTableView()
        tableView.reloadData()
    }
    
    @objc func moveToThemes(_ sender: UIButton) {
        sender.setTitleColor(.purple, for: .normal)
        categoryButton.setTitleColor(.black, for: .normal)
        trendingButton.setTitleColor(.black, for: .normal)
        self.tableView.removeFromSuperview()
        setUpCollectionView()
        
    }
    
    @objc func moveToTrending(_ sender: UIButton) {
        sender.setTitleColor(.purple, for: .normal)
        themesButton.setTitleColor(.black, for: .normal)
        categoryButton.setTitleColor(.black, for: .normal)
        self.tableView.removeFromSuperview()
        self.collectionView?.removeFromSuperview()
        tableViewType = .trending
        setUpTableView()
        tableView.reloadData()
    }
    
}

extension ExploreTabViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch tableViewType {
        case .category: return UIView()
        case .trending:  let view = TrendingTableViewHeader.loadView()
        view.setUpUI(trendingViewModel.getSectionAt(section))
        return view
        case .none: return nil
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch tableViewType {
        case .category: return 1
        case .trending: return trendingViewModel.getSections().count
        case .none: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableViewType == .category {
            return 100
        }
        else {
            return UITableView.automaticDimension
        }
    }
    
}

extension ExploreTabViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableViewType {
        case .category: return categoryViewModel.getCategories().count
        case .trending:  return trendingViewModel.getDataForSection(section).count
        case .none: return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableViewType {
            
        case .category: guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.cellIdentifier(), for: indexPath) as? CategoryTableViewCell else { fatalError()}
        cell.configureCell(categoryViewModel.getCategoryAt(indexPath))
        cell.delegate = self
        return cell
            
        case .trending:  guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier(), for: indexPath) as? TrendingTableViewCell else {
            fatalError()
        }
        cell.configureCell(trendingViewModel.getDataForSectionAt(indexPath))
        return cell
            
        case .none: guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier(), for: indexPath) as? TrendingTableViewCell else {
            fatalError()
        }
        cell.configureCell(trendingViewModel.getDataForSectionAt(indexPath))
        return cell
        }
        
        
    }
}

extension ExploreTabViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped on CollectionView Item#: \(indexPath.row)")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let singleItemWidth = (collectionView.frame.size.width - 10 * (2 - 1)) / 2
        let singleItemHeight: CGFloat = singleItemWidth
        let itemSize = CGSize(width: singleItemWidth, height: singleItemHeight)
        return itemSize
    }
    
}

extension ExploreTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themeViewModel.getThemes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemesCollectionViewCell.cellIdentifier(), for: indexPath) as? ThemesCollectionViewCell else { fatalError() }
        cell.configureCell(themeViewModel.getThemeAt(indexPath))
        return cell
    }
}

extension ExploreTabViewController: CategoryDelegate {
    func didTapOnBtn(_ sender: CategoryTableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            print("Tapped on cell# : \(indexPath.row)")
        }
    }
}
