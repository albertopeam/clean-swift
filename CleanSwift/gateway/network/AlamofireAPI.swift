//
//  AlamoFireApi.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 14/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class AlamofireAPI {
    /*
    func execute(_ request: Request) -> Response {
        var data: Any?
        var error: Error?
        let group = DispatchGroup()
        group.enter()
        Alamofire.request(request.path)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(response.result.error)")
                    return
                }
                
                if let collectionData = response.result.value as? [[String:AnyObject]] {
                    let collection : [Deal] = collectionData.flatMap { data in
                        guard let title = data["title"] as? String,
                            let thumb = data["thumb"] as? String
                            else {
                                return nil
                        }
                        return Deal(title: title, thumb: thumb)
                    }
                    data = collection as Any
                    print(collectionData)
                }
                
                
                /*guard let value = response.result.value as? [Array<Any>: Any],
                    let rows = value["rows"] as? [[String: Any]] else {
                        print("Malformed data received from fetchAllRooms service")
                        return
                }*/
                
                /*
                let rooms = rows.flatMap({ (roomDict) -> Deal? in
                    return Deal(title: "", thumb: "")
                })
                print(rooms)
        */
            //let decoder = JSONDecoder()
            //let todoJSON = JSONSerialization.jsonObject(with: response, options: []) as? [String: Any]
//            do {
//                let todos = try decoder.decode([Deal].self, from: response)
//            } catch {
//                print("error trying to convert data to JSON")
//                print(error)
//            }
            error = response.error
            group.leave()
        }
        let result:DispatchTimeoutResult = group.wait(timeout: .now() + .milliseconds(10000))
        return Response(data: data, error: error)
    }
 */
}
