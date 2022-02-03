//
//  List.swift
//  TableViewPractice
//
//  Created by Byapps on 2022/02/03.
//

import Foundation

struct List: Decodable {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}
