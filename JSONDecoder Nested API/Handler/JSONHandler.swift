//
//  JSONHandler.swift
//  JSONDecoder Nested API
//
//  Created by Sharetrip-iOS on 17/08/2021.
//

import Foundation

class JSONHandler{
    
    static let instance = JSONHandler()
    var users = [Users]()
    
    weak var vc : ViewController!
    
    func setupJsonHandler(completion : @escaping ( _ users :[Users])->()){
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        let url = URL(string: urlString)
        
        guard let userUrl = url else {return }
        
        
        let task = URLSession.shared.dataTask(with: userUrl) { (data, response, error) in
            
            guard error == nil else {
                return
            }
            if let data = data {
                
                let decoder = JSONDecoder()
              
                do {
                    
                    self.users =  try decoder.decode([Users].self, from: data)
                    
                    DispatchQueue.main.async {
                        for x in self.users{
                            print(x.address.geo.latitude)
                        }
                    }
                    completion(self.users)
                   
                    
                } catch let err {
                    print(err.localizedDescription)
                    return
                }
                
                
            }else{
                return
            }
            
            
            
        }
        task.resume()
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}
