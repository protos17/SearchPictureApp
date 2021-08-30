//
//  PhotoViewController.swift
//  SearchPicture
//
//  Created by Данил Чапаров on 29.08.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var image: UIImage?
    
    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImage.image = image
    }
}
