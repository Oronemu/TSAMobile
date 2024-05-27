//
//  IntroModel.swift
//  Platform
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import AppUI

public struct Intro: Identifiable {
    public var id: String = UUID().uuidString
    public var image: String
    public var title: String
    public var subtitle: String
}

public let intros: [Intro] = [
    .init(image: AppUIAsset.Assets.perfomance.name, title: "Высокая производительность", subtitle: "Весь анализ происходит на специализированном серверном оборудовании, поэтому можете не беспокоиться насчет размеров вашего датасета!")
]
