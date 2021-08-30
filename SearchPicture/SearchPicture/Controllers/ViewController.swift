//
//  ViewController.swift
//  SearchPicture
//
//  Created by Данил Чапаров on 29.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var searchtext = ""
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard searchTextField.text != nil else { return }
        guard segue.identifier == K.pictureSegue else { return }
        self.searchtext = searchTextField.text!
        guard let destination = segue.destination as? PhotoCollectionViewController else { return }
        destination.searchText = searchtext
        destination.navigationItem.title = searchtext
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
    }
}
