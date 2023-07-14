//
//  Posts.swift
//  Arab News
//
//  Created by Mohamed Elkomey on 07/07/2023.
//

import Foundation

struct Posts:Decodable{
    var status:String
    var totalResults:Int
    var articles:[Article]
}

struct Article:Decodable{
    var title:String
    var url:String
}
