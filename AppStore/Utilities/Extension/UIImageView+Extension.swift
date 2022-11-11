////
////  UIImageView+Extension.swift
////  AppStore
////
////  Created by Burak AKCAN on 20.10.2022.
////
//
//import UIKit
//
//let imageCache = NSCache<NSString,UIImage>()
//
//extension UIImageView {
//   
//    @discardableResult
//    //Hataları görmezden gel demek
//    func loadFromURL(urlString:String, placeHolder: UIImage? = UIImage(systemName: "photo") )-> URLSessionDataTask? {
//        self.image = nil
//        
//        let key = NSString(string: urlString)
//        if let cachedImage = imageCache.object(forKey: key) {
//            self.image = cachedImage
//            return nil
//        }
//        guard let url = URL(string: urlString) else {
//            print("url hatalı")
//            return nil
//        }
//        if let placeHolder = placeHolder {
//            self.image = placeHolder
//        }
//        let task = URLSession.shared.dataTask(with: url) { data, _,_ in
//            DispatchQueue.main.async {
//                if let data = data, let downloadedImage = UIImage(data: data){
//                    imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
//                    self.image = downloadedImage
//                }
//            }
//        }
//        task.resume()
//        return task
//    }
//    
//    
//    
//}
