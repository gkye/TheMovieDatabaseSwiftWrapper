@testable import TMDBSwift
import Foundation

extension Translation {
    static var mock: Translation = Translation(countryCode: "MX", language: .en, content: .mock)
}

extension Translation.Content {
    static var mock = Translation.Content(homepage: "http://latino.starwars.com/",
                                          overview: "La Princesa Leia Organa ha sido capturada por Darth Vader por tener los planos de la Estrella de la muerte, la temida estación espacial del imperio. Dos androides escapan al planeta Tatooine, ambos son comprados por Luke Skywalker, un joven granjero, este se entera de un mensaje que ella, uno de ellos y busca a Obi Wan Kenobi, un antiguo caballero Jedi que lo lleva a conocer sobre la fuerza y como utilizarla. Contratan a Han Solo, un foragido espacial que tiene al Halcón Milenario, una gran nave capaz de recorrer a la velocidad de la luz con la intención de rescatar a la princesa y luego organizar una batalla para destruir a la Estrella de la muerte.",
                                          runtime: 121,
                                          tagline: "Hace mucho tiempo, en una galaxia muy lejana....",
                                          title: "La guerra de las galaxias")
}
