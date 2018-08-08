//
//  SearchViewController.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SearchViewModel!
    let searchController = UISearchController(searchResultsController: nil)
    var input: SearchV2P!
    var shouldShowSearchResults = false
    var currText: String?
    
    override func loadView() {
        super.loadView()
        let config = SearchConfigurator()
        config.configureModuleForViewInput(viewInput: self)
        self.viewModel = SearchViewModel.init(searchText: "jack johnson", list: [])
        self.view.backgroundColor = AppColor.themeBlue
        
        if let navController = self.navigationController {
            self.title = "Music Search"
            AppConfig.setNavigationBarThemeDefault(navController)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
        if #available(iOS 11, *) {
            
        } else {
            self.edgesForExtendedLayout = [];
        }
        self.configSearchController()
        self.registerTableView()
        self.setupInitialState()
    }
    
    private func configSearchController() {
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = .white
        self.searchBar.text = self.viewModel.searchText
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = true
        self.searchBar.placeholder = "搜尋關鍵字"
        self.searchBar.sizeToFit()
    }
    
    private func setupInitialState() {
        self.input.searchKeyword(text: self.viewModel.searchText)
    }
}

extension SearchViewController: SearchP2V {
    func searchFailure(msg: String) {
        AlertHelper.show(vc: self, msg: msg)
    }
    
    func searchFinished(result: [TrackCellViewModel]) {
        self.viewModel.list = result
        self.tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func registerTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.font = AppConfig.UnitFont(16)
        cell.textLabel?.text = self.viewModel.list[indexPath.row].title
        cell.detailTextLabel?.text = "Price: \(self.viewModel.list[indexPath.row].subTitle ?? "未知")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        input.push2TrackVC(id: self.viewModel.list[indexPath.row].id)
    }
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate, UISearchDisplayDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        self.tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.currText = searchBar.text!
        if searchBar.text == "" {
            shouldShowSearchResults = false
            self.tableView.reloadData()
        }
        self.input.searchKeyword(text: self.currText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        self.view.endEditing(true)
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.currText = searchBar.text!
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            self.tableView.reloadData()
        }else {
            self.input.searchKeyword(text: self.currText)
//            self.filtering(text: self.currentSearchingText)
        }
        
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        guard let searchString = searchText else {
        //            return
        //        }
        
        // Filter the data array and get only those countries that match the search text.
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else {
            return
        }
        
        // Filter the data array and get only those countries that match the search text.
//        filteredShops = shops.filter({ (shop) -> Bool in
//            let shopText:NSString = shop.name! as NSString
//
//            return (shopText.range(of: searchString, options: .caseInsensitive).location) != NSNotFound
//        })
        
        // Reload the tableview.
        self.tableView.reloadData()
    }
}
