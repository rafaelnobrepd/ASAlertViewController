//
//  ASAlertMultiselectController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 19/04/17.
//
//

import Foundation

public class ASAlertMultiselectController: ASAlertSelectController {
    
    // MARK: - Variables
    
    public var onSelectedOptions: ((_ option: [ASAlertSelectOption]?) -> Void)?
    
    override internal var customHandlers: [ASAlertHandler] {
        let cancelHandler = ASAlertAction("Cancelar", type: .cancel, handler: {
            self.dismiss()
        })
        
        let selectHandler = ASAlertAction("Selecionar", type: .default, handler: {
            let options = self.selectedOptions
            options.forEach { option in option.onAction?() }
            
            self.onSelectedOptions?(options)
            self.dismiss()
        })
        
        return [cancelHandler, selectHandler]
    }
    
    private var selectedOptions: [ASAlertSelectOption] = []
    
    // MARK: - Public Functions
    
    override internal func setupSelectedOption() {
        alertSelectView.onSelectedOptions = { options in
            self.selectedOptions = options
        }
    }
    
}
