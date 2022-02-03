//
//  ListTableViewCell.swift
//  TableViewPractice
//
//  Created by Byapps on 2022/02/03.
//

import UIKit
import SnapKit

final class ListTableViewCell: UITableViewCell {
    static let identifier = "ListTableViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)

        return label
    }()
    
    func update(_ list: List) {
        setupLayout()
        
        titleLabel.text = list.title
    }
}

private extension ListTableViewCell {
    func setupLayout() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10.0)
        }
    }
}
