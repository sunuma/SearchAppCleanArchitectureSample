//
//  SelectCategoryViewController.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/19.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit
import RxSwift

class SelectCategoryViewController: UIViewController {
    @IBOutlet weak var searchCategoryField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    private var selectCategory: SelectCategoryPresenterProtocol!
    private let disposeBag = DisposeBag()
    private var listData: [CategorySmallInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCategoryField.placeholder = "2文字以上入力してください"
        searchCategoryField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        selectCategory = initializeSelectCategory()
        subscribe()
        selectCategory.subscribe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        searchCategoryField.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITextFieldDelegate

extension SelectCategoryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchWord = textField.text else { return true }
        if searchWord.count <= 1 { return true }
        let repaceWord = searchWord.replacingOccurrences(of: " ", with: ",").replacingOccurrences(of: "　", with: ",")
        var param = ShopAPIParam()
        param.freeWord = repaceWord
        let vc = R.storyboard.shopList.instantiateInitialViewController()!
        vc.initalize(param: param)
        navigationController?.pushViewController(vc, animated: true)
        return true
    }
}

extension SelectCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.selectAddressCell, for: indexPath) {
            cell.label.text = self.listData[indexPath.row].name
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.text = self.listData[indexPath.row].name
            return cell
        }
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryInfo = self.listData[indexPath.row]
        var param = ShopAPIParam()
        param.categoryS = categoryInfo.code
        param.categoryL = categoryInfo.parentCode
        let vc = R.storyboard.shopList.instantiateInitialViewController()!
        vc.initalize(param: param)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SelectCategoryViewController {
    func subscribe() {
        // select category presenter subscribe
        selectCategory.listData.subscribe(onNext: { [unowned self] result in
            self.listData = result.info
            self.tableView.reloadData()
        }, onError: { error in
            appDump(error)
        }).disposed(by: disposeBag)
    }
}
