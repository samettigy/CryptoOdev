//
//  ViewController.swift
//  KriptoParaUygulamasi
//
//  Created by Atil Samancioglu on 21.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let myTableView = UITableView()
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    
    let cryptoVM = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        setupBindings()
        cryptoVM.requestData()
        
    }
    
    private func setupUITableView() {
        myTableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: "defaultCell")
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    private func setupBindings() {
        
        //        cryptoVM
        //            .cryptos
        //            .observe(on: MainScheduler.asyncInstance)
        //            .subscribe { cryptos in
        //              self.cryptoList = cryptos
        //                self.tableView.reloadData()
        //            }.disposed(by: disposeBag)
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] cryptos in
                self?.cryptoList = cryptos
                self?.myTableView.reloadData()
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
        
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }.disposed(by: disposeBag)
        
        
        cryptoVM
            .loading
        //.bind(to: self.activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        
        cryptoVM
            .loading
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { bool in
                print(bool)
            }.disposed(by: disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! CryptoTableViewCell
        cell.currencyLabel.text = cryptoList[indexPath.row].currency
        cell.priceLabel.text = cryptoList[indexPath.row].price
        return cell
        
    }
    
    
}

