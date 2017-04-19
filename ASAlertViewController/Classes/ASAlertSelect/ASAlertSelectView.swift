//
//  ASAlertMultiselectView.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation

class ASAlertSelectView: UIView {

    // MARK: - Components

    @IBOutlet fileprivate weak var tvOptions: UITableView?

    // MARK: - Variables

    var onSelectedOptions: ((_ options: [ASAlertSelectOption]) -> Void)?
    var options: [ASAlertSelectOption] = []
    
    var nib: ASAlertSelectView {
        guard let view = loadNib() as? ASAlertSelectView else { fatalError() }
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
        let nib = UINib(nibName: "ASAlertSelectCell", bundle: bundle)

        tvOptions?.delegate = self
        tvOptions?.dataSource = self
        tvOptions?.register(nib, forCellReuseIdentifier: "cell")
    }
    
}

extension ASAlertSelectView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var option = options[indexPath.row]
        option.isSelected = !option.isSelected
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = option.isSelected ? .checkmark : .none
        
        onSelectedOptions?(options.filter { option in option.isSelected })
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

}

extension ASAlertSelectView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ASAlertSelectCell else {
            fatalError()
        }
        cell.setup(from: options[indexPath.row])

        return cell
    }

}
