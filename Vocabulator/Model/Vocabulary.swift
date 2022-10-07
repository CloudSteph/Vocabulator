//
//  VocabList.swift
//  Vocabulator
//
//  Created by Stephanie Liew on 10/6/22.
//

import Foundation

struct Vocabulary {
    let word: String
    let speechType: String
    let definition: String
}

let sampleWords: [Vocabulary] = [.init(word: "Coding", speechType: "noun", definition: "the process or activity of writing computer programs"),
                                .init(word: "Amazing", speechType: "adjective", definition: "causing great surprise or wonder; astonishing"),
                                .init(word: "Breathe", speechType: "verb", definition: "take air into the lungs and then expel it")]
