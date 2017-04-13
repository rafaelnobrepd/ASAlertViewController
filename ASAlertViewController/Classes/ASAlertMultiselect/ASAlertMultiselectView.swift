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

class ASAlertMultiselectView: UIView {

    // MARK: - Components

    @IBOutlet fileprivate weak var tvOptions: UITableView?

    // MARK: - Handlers

    var selectedOption: ((_ option: ASAlertMultiselectOption) -> Void)?

    // MARK: - Variables

    var options: [ASAlertMultiselectOption] = []
    var onValueChange: ((_ date: Date?) -> Void)?

    var nib: ASAlertMultiselectView {
        guard let view = loadNib() as? ASAlertMultiselectView else { fatalError() }
        return view
    }

    // MARK: - Lifecircle Class

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }

    // MARK: - Private Methods

    private func setupTableView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ASAlertMultiselectCell", bundle: bundle)

        tvOptions?.delegate = self
        tvOptions?.dataSource = self
        tvOptions?.register(nib, forCellReuseIdentifier: "cell")
    }
    
}

extension ASAlertMultiselectView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedOption?(options[indexPath.row])
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

extension ASAlertMultiselectView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ASAlertMultiselectCell else {
            fatalError()
        }
        cell.setup(from: options[indexPath.row])

        return cell
    }

}
