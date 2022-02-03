//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Byapps on 2022/02/03.
//

import UIKit
import SnapKit

final class ListViewController: UIViewController {
    private lazy var presenter = ListPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension ListViewController: ListProtocol {
    func setupLayout() {
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
