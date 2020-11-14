//
//  Movie.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 14/11/20.
//  Copyright © 2020 Afrodev. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let title: String
    let categories: String
    let duration: String
    let rating: Double
    let summary: String
    let image: String
    
    //Propriedade computada
    var ratingFormatted: String {
        "⭐️ \(rating)/10"
    }
    
    var smallImage: String {
        "\(image)small"
    }
    
    /*
    enum CodingKeys: String, CodingKey {
        case title = "titulo"
        case categories = "categorias"
        case duration, rating, summary, image
    }
    */
}
