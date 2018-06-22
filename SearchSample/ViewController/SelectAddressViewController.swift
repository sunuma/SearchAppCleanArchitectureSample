//
//  SelectAddressViewController.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit
import RxSwift

/**
 *
 */
class SelectAddressViewController: UIViewController {
    @IBOutlet weak var searchAddressField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    private var presenter: SelectAddressPresenterProtcol!
    private let disposeBag = DisposeBag()
    private var listData: [PrefecturesInfo] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        searchAddressField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        presenter = initializeSelectAddress()
        subscribe()
        presenter.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IBAction
    
    @IBAction func onClickCurrentLocation() {
        
    }
    
    @IBAction func onClickReturn() {
        
    }
}

// MARK: - UITextFieldDelegate

extension SelectAddressViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let _ = textField.text else {
            return false
        }
        return true
    }
}

extension SelectAddressViewController: UITableViewDelegate, UITableViewDataSource {
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
        
    }
}

extension SelectAddressViewController {
    func subscribe() {
        presenter.listData.subscribe(onNext: { [unowned self] result in
            self.listData = result.info
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        presenter.error.subscribe(onError: { error in
            appDump(error)
        }).disposed(by: disposeBag)
    }
}
