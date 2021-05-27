//
//  UpdateViewController.swift
//  CMListAddUpdateBackDataPassDemo
//
//  Created by Mirajkar on 27/04/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import UIKit

class UpdateViewController: BaseViewController {

    //MARK: Global Variables
    @IBOutlet weak var updateNameTextField: UITextField!
    @IBOutlet weak var updateStateTextField: UITextField!
    @IBOutlet weak var updateDetailTextView: UITextView!
    var tag: Int?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CM Detail Update"
        let saveButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(updateBtnAction))
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.rightBarButtonItem?.title = "Update"
        
        self.updateNameTextField.delegate = self
        self.updateStateTextField.delegate = self
        
        //Get CMObject
        let cmObject = CMManager.sharedInstance.getObject(tag: tag!)
        
        updateNameTextField.text = cmObject.name
        if cmObject.state == "placeholder" {
            updateStateTextField.text = ""
        } else {
            updateStateTextField.text = cmObject.state
        }
        updateDetailTextView.text = cmObject.details
        
    }
    
    //MARK: Button Action
    @objc func updateBtnAction() {

        let state = updateStateTextField.text?.capitalized
        if updateNameTextField.text?.count == 0 {
           showAlert(title: "Alert", message: "Enter name", vc: self)
        } else {
          let _ = CMManager.sharedInstance.addCMObject(obj: CMObject(name: updateNameTextField.text,state: state!.isEmpty ? "placeholder" : state, details: updateDetailTextView.text), tag: tag!)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
