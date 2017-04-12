//
//  ASAlertMultiselectView.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation

public enum ASAlertMultselectType {
    case single
    case multiple
}

class ASAlertMultselectView: UIView {

    // MARK: - Components

    @IBOutlet fileprivate weak var tvOptions: UITableView?

    // MARK: - Variables

    var onValueChange: ((_ date: Date?) -> Void)?

    var nib: ASAlertMultselectView {
        guard let view = loadNib() as? ASAlertMultselectView else {
            fatalError()
        }
        return view
    }

    // MARK: - Lifecircle Class

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Private Methods
    
}

extension ASAlertMultselectView: UITableViewDelegate {

    

}

extension ASAlertMultselectView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
