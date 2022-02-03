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
    
    private var testValue: [List] = [
        List(title: "제목1"),
        List(title: "제목2"),
        List(title: "제목3"),
        List(title: "제목4"),
        List(title: "제목5"),
        List(title: "제목6"),
        List(title: "제목7"),
        List(title: "제목8"),
        List(title: "제목9")
    ]
    
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
        return testValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell
        
        let val = testValue[indexPath.item]
        cell?.update(val)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            testValue.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("\(sourceIndexPath.row) -> \(destinationIndexPath.row)")
        let moveCell = testValue[sourceIndexPath.item]
        testValue.remove(at: sourceIndexPath.item)
        testValue.insert(moveCell, at: destinationIndexPath.item)
    }
}

extension ListPresenter: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
}

extension ListPresenter: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if session.localDragSession != nil {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
    }
}
