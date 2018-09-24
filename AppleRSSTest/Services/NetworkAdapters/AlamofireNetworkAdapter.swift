//
//  AlamofireNetworkAdapter.swift
//  AppleRSSTest
//
//  Created by Trevor Doodes on 24/09/2018.
//  Copyright © 2018 Ironworks Media Limited. All rights reserved.
//

import Alamofire

public class AlamofireNetworkAdapter: NetworkAdapter {
    
    func get(url: URL, completionHandler: @escaping CompletionHandler) {
        
        Alamofire.request(url).responseJSON { response in
            
            switch response.result {
            case .success(_):
                let data = response.data! as JsonData
                let result = Response.success(data)
                completionHandler(result)
            case .failure(let error):
                let result = Response<JsonData>.failure(error)
                completionHandler(result)
            }
        }
    }
}
