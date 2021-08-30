//
//  PictureManager.swift
//  SearchPicture
//
//  Created by Данил Чапаров on 29.08.2021.
//

import UIKit

protocol PictureManagerDelegate {
    func updateTableView()
}

class PictureManager {
    
    var pictureData = [Any]()
    var images = [String]()
    var delegate: PictureManagerDelegate?
    
    func fetchPicture(text: String) {
        let urlString = "\(K.unsplashURL)\(K.apiKey)&query=\(text)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(PictureData.self, from: data)
                self.pictureData = objects.results.map({ photo in
                    self.images.append(photo.urls.regular)
                })
                self.delegate?.updateTableView()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    var numberOfItems: Int {
        return pictureData.count
    }
    
    func configureCell(cell: PhotoCell, for indexPath: IndexPath) {
        
        cell.photoImageView.image = UIImage(systemName: K.defaultPicture)
        
        let picture = images[indexPath.item]
        
        DispatchQueue.global().async {
            let imageURL = URL(string: picture)
            guard let imageData = try? Data(contentsOf: imageURL!) else { return }
            
            DispatchQueue.main.async {
                cell.photoImageView.image = UIImage(data: imageData)
            }
        }
    }
}
