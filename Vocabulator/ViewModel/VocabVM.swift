//
//  VocabVM.swift
//  Vocabulator
//
//  Created by Stephanie Liew on 10/6/22.
//

import Foundation

final class VocabVM {

    private var words: [Vocabulary] = []
    
    init() {
        words = sampleWords
    }
    
    //display random words
    func randomVocab() -> Vocabulary? {
        return words.randomElement()
    }
    
    //counts number terms
    func count() -> Int {
        return words.count
    }
    
    //display words in each row
    func term(at indexPath: IndexPath) -> Vocabulary {
        return words[indexPath.row]
    }
}

