//
//  CustomDeliveryNotesViewController.swift
//  Restaurant-App
//
//  Created by Rajiv Shrestha on 7/25/22.
//

import UIKit

protocol CustomDeliveryNotesSelectorDelegate {
    func customNotesSelected(notesTitle: String)
}


class CustomDeliveryNotesViewController: UIViewController {

    @IBOutlet var bottomView: DesignableView!
    @IBOutlet var lblTitleText: UILabel!
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var imgTitleImage: UIImageView!
    @IBOutlet var btnOuterClose: UIButton!
    @IBOutlet var customNotesTextView: UITextView!
    
    var delegate: CustomDeliveryNotesSelectorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        self.delegate?.customNotesSelected(notesTitle: customNotesTextView.text)
        self.didTapClose()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.didTapClose()
    }
    
    @objc func didTapClose() {
        view.endEditing(true)
        //        dismiss(animated: true, completion: nil)
        if self.isModal() {
            self.dismiss(animated: true, completion: nil)
        } else {
            _ = navigationController?.popViewController(animated: false)
        }
    }
}
