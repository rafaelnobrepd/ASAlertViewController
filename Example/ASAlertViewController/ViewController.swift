//
//  ViewController.swift
//  ASAlertViewController
//
//  Created by adriano@adrianosouzacosta.com on 03/31/2017.
//  Copyright (c) 2017 adriano@adrianosouzacosta.com. All rights reserved.
//

import UIKit
import ASAlertViewController

class ViewController: UIViewController {

    // MARK: - Actions

    @IBAction private func showAlertController() {
        let alert = UIAlertController(title: "Deseja sair da aplicação?", message: "Selecione uma das opções abaixo:", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Sim", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Não", style: .destructive, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    @IBAction private func showASAlertController() {
        let alert = ASAlertController(title: "Deseja sair da aplicação?", message: "Selecione uma das opções abaixo:")
        alert.addAction(ASAlertAction("Sim", type: .default) {  print("aeee") })
        alert.addAction(ASAlertAction("Não", type: .destructive))
        alert.addAction(ASAlertAction("Sim", type: .cancel))

        alert.present(in: self)
    }

    @IBAction private func showASAlertDateTimeController() {
        let alert = ASAlertDateTimeController(title: "Selecione uma data", message: "Selecione uma das opções abaixo:", type: .date)
        alert.onSelectDateAction = { date in
            if let date = date {
                print(date)
            }
        }
        alert.present(in: self)
    }

}

