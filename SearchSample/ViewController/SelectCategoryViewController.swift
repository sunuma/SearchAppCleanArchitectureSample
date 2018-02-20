//
//  SelectCategoryViewController.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/19.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit

/**
 *
 */
enum ShopSearchTextFeildType {
    case keyword
    case shopName
}

/**
 *
 */
protocol SelectCategoryViewInput: class {
    
}

/**
 *
 */
class SelectCategoryViewController: UIViewController {
    
    @IBOutlet weak var searchCategoryField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var currentInputType: ShopSearchTextFeildType = .keyword
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCategoryField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        //presenter.viewDidLoad(self)
    }
    
    @IBAction func onClickKeyword() {
        currentInputType = .keyword
    }
    
    @IBAction func onClickShopName() {
        currentInputType = .shopName
    }
    
}

// MARK: - UITextFieldDelegate

extension SelectCategoryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let inputText = textField.text else {
            return false
        }
        //presenter.searchInputText(inputText)
        return true
    }
}

extension SelectCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //presenter.setupTableCell(cell)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //presenter.selectedTableCell(tableView, didSelectRowAt: indexPath)
    }
}

extension SelectCategoryViewController: SelectCategoryViewInput {
    
}
