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
    
    func randomVocab() -> Vocabulary? {
        return words.randomElement()
    }
}
