//
//  Fakery+Extensions.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Fakery

public extension Faker {

    static var brazilian: Faker {
        return Faker(locale: L10n.Symbol.locale)
    }

}

public extension Faker.Number {

    func randomCpf() -> String {
        var cpf = Array(repeating: 0, count: 11)
        var temp1 = 0, temp2 = 0

        (0...8).forEach {
            cpf[$0] = (Int)(arc4random_uniform(9))
            temp1 += cpf[$0] * (10 - $0)
            temp2 += cpf[$0] * (11 - $0)
        }

        temp1 %= 11
        cpf[9] = temp1 < 2 ? 0 : 11-temp1

        temp2 += cpf[9] * 2
        temp2 %= 11
        cpf[10] = temp2 < 2 ? 0 : 11-temp2
        return (0...10).map({ cpf[$0] }).string
    }

    func randomCnpj() -> String {
        var cnpj = Array(repeating: 0, count: 14) // [0,0,0,0,0,0,0,0,0,0,0,1,0,0]
        cnpj[11] = 1
        var temp1 = 2, temp2 = 3, baseDig1 = 5, baseDig2 = 6

        (0...7).forEach {
            cnpj[$0] = (Int)(arc4random_uniform(9))
            temp1 += cnpj[$0] * baseDig1
            temp2 += cnpj[$0] * baseDig2

            baseDig1 = baseDig1 == 2 ? 9 : baseDig1-1
            baseDig2 = baseDig2 == 2 ? 9 : baseDig2-1
        }

        temp1 %= 11
        cnpj[12] = temp1 < 2 ? 0 : 11-temp1

        temp2 += cnpj[9] * 2
        temp2 %= 11
        cnpj[13] = temp2 < 2 ? 0 : 11-temp2
        return (0...13).map({ cnpj[$0] }).string
    }

    func randomCpfCnpj() -> String {
        return [randomCpf(), randomCnpj()].randomElement() ?? String()
    }
}

public extension Faker.Name {

    func givenName() -> String {
        return "\(firstName()) \(lastName())"
    }
}
