//
//  VocabList.swift
//  Vocabulator
//
//  Created by Stephanie Liew on 10/6/22.
//

import Foundation

// MARK: - Model (Blueprint)
struct Vocabulary {
    let word: String
    let speechType: String
    let definition: String
}

// MARK: - Test Data
let sampleWords: [Vocabulary] = [.init(word: "Coding", speechType: "noun", definition: "the process or activity of writing computer programs"),
                                .init(word: "Amazing", speechType: "adjective", definition: "causing great surprise or wonder; astonishing"),
                                .init(word: "Breathe", speechType: "verb", definition: "take air into the lungs and then expel it"),
                                .init(word: "content", speechType: "adjective" , definition: "in a state of peaceful happiness"),
                                .init(word: "law", speechType: "noun" , definition: "a system or collection of such rules"),
                                .init(word: "determination", speechType: "noun" , definition: "the act of coming to a decision or of fixing or setting a purpose"),
                                .init(word: "endeavour", speechType: "verb" , definition: "to try (to do something)"),
                                .init(word: "surmount", speechType: "verb" , definition: "to mount upon; get on the top of; mount upon and cross over"),
                                .init(word: "keen", speechType: "adjective" , definition: "finely sharpened, as an edge; so shaped as to cut or pierce substances readily"),
                                .init(word: "debris", speechType: "noun" , definition: "the remains of anything broken down or destroyed; ruins; rubble"),
                                .init(word: "meager", speechType: "adjective" , definition: "deficient in quantity or quality; lacking fullness or richness; scanty; inadequate"),
                                .init(word: "body", speechType: "noun" , definition: "the physical structure and material substance of an animal or plant, living or dead"),
                                .init(word: "affliction", speechType: "noun" , definition: "a state of pain, distress, or grief; misery"),
                                .init(word: "workout", speechType: "verb" , definition: "a structured regime of physical exercise"),
                                .init(word: "yield", speechType: "verb" , definition: "to give up or surrender"),
                                .init(word: "promulgated", speechType: "adjective" , definition: "publicly declared; formally proclaimed or put into effect"),
                                .init(word: "dream", speechType: "noun" , definition: "a succession of images, thoughts, or emotions passing through the mind during sleep"),
                                .init(word: "sad", speechType: "adjective" , definition: "affected by unhappiness or grief; sorrowful or mournful")
                                ]
