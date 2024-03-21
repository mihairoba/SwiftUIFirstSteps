//
//  Utils.swift
//  DailyJournal
//
//  Created by Mihai Roba on 14.03.2024.
//

import UIKit.UIImage

func generateImages() -> [UIImage] {
    var photos = [UIImage]()
    for _ in 0...arc4random_uniform(5) {
        let randomNumer = arc4random_uniform(100)
        if let photo = UIImage(named: String(format: "photo%d", randomNumer % 4)) {
            photos.append(photo)
        }
    }
    return photos
}

func generateTags() -> [String] {
    var tags = [String]()
    let words = loremIpsum.components(separatedBy: CharacterSet(charactersIn: " ,."))
    for _ in 0...arc4random_uniform(20) {
        let randomTag = words[numericCast(arc4random_uniform(numericCast(words.count)))]
        if randomTag.count > 2 {
            tags.append(randomTag)
        }
    }
    return tags
}

func generateSumary() -> String {
    let words = loremIpsum.components(separatedBy: CharacterSet(charactersIn: " ,."))
    var wordsArray = [String]()
    for _ in 0...arc4random_uniform(20) {
        let randomWord = words[numericCast(arc4random_uniform(numericCast(words.count)))]
        if randomWord.count > 2 {
            wordsArray.append(randomWord)
        }
    }
    
    return wordsArray.joined(separator: " ")
}

func randomDate() -> Date {
    let calendar = Calendar.current
    return calendar.date(byAdding: .day, value: -Int(arc4random_uniform(365)), to: Date()) ?? Date()
}
