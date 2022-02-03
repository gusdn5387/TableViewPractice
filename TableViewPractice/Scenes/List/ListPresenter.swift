//
//  ListPresenter.swift
//  TableViewPractice
//
//  Created by Byapps on 2022/02/03.
//

import UIKit

protocol ListProtocol: AnyObject {
    func setupLayout()
}

final class ListPresenter: NSObject {
    private weak var viewController: ListProtocol?
    
    init(viewController: ListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupLayout()
    }
}

extension ListPresenter: UITableViewDelegate {
    
}

extension ListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
