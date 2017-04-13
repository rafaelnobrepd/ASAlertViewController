//
//  ViewController.swift
//  ASAlertViewController
//
//  Created by adriano@adrianosouzacosta.com on 03/31/2017.
//  Copyright (c) 2017 adriano@adrianosouzacosta.com. All rights reserved.
//

import UIKit
import ASAlertViewController

class Option: ASAlertMultiselectOption {

    var title: String {
        get { return "teste sldfkjsldkfj sldkfjs ldkfjsdlfs dlfkj" }
        set {}
    }

    var detail: String {
        get { return "teste" }
        set {}
    }

    var image: UIImage? {
        get { return nil }
        set {}
    }

    var selected: Bool {
        get { return false }
        set {}
    }

    var onAction: (() -> Void)? {
        get { return nil }
        set {}
    }

}

class ViewController: UIViewController {

    // MARK: - Actions

    @IBAction fileprivate func showAlertController() {
        let alert = UIAlertController(title: "Deseja sair da aplicação?", message: "Selecione uma das opções abaixo:", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Sim", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Não", style: .destructive, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    @IBAction fileprivate func showASAlertController() {
        let alert = ASAlertController(title: "Deseja sair da aplicação?", message: "Selecione uma das opções abaixo:")
        alert.addAction(ASAlertAction("Limpar", type: .destructive))
        alert.addAction(ASAlertAction("Selecionar", type: .default) {  print("aeee") })

        alert.present(in: self)
    }

    @IBAction fileprivate func showASAlertDateController() {
        let alert = ASAlertDateController(title: "Selecione uma data", message: "Selecione uma das opções abaixo:")
        
        alert.onSelectedDateAction = { date in
            if let date = date {
                print(date)
            }
        }
        
        alert.present(in: self)
    }
    
    @IBAction fileprivate func showASAlertTimeController() {
        let alert = ASAlertTimeController(title: "Selecione uma horário", message: "Selecione uma das opções abaixo:")
        
        alert.onSelectedDateAction = { date in
            if let date = date {
                print(date)
            }
        }
        
        alert.present(in: self)
    }
    
    @IBAction fileprivate func showASAlertDateTimeController() {
        let alert = ASAlertDateTimeController(title: "Selecione uma data", message: "Selecione uma das opções abaixo:", type: .dateTime)
        
        alert.onSelectedDateAction = { date in
            if let date = date {
                print(date)
            }
        }
        
        alert.present(in: self)
    }

    @IBAction fileprivate func showASAlertMultselectController() {
        let options = [Option(), Option(), Option(), Option(), Option(), Option(), Option(), Option()]

        let alert = ASAlertMultiselectController(title: "Selecione uma opção", message: "Selecione uma das opções abaixo:")
        alert.addOptions(options)
        alert.present(in: self)
    }

}

