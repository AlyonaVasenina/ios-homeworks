//
//  Post.swift
//  Navigation
//
//  Created by Alena Vasenina on 28.10.2021.
//

import UIKit

struct Post {
    var title: String
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static let test1 = Post(title: "Дельфины", author: "primocean_aquarium",
                            description: "Глаза дельфинов отлично приспособлены, чтобы видеть и под водой, и на воздухе. Поэтому они без труда рассчитывают траекторию для прыжков и хорошо различают своих тренеров.",
                            image: "dolfins", likes: 132, views: 36)
    static let test2 = Post(title: "", author: "", description: "", image: "", likes: 35, views: 489)
    static let test3 = Post(title: "", author: "", description: "", image: "", likes: 265, views: 156)
    static let test4 = Post(title: "", author: "", description: "", image: "", likes: 376, views: 67)
    
    let testPosts = [test1, test2, test3, test4]
}
