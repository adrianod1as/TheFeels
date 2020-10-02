//
//  ViewModeling.swift
//  Common
//
//  Created by Adriano Dias on 29/09/20.
//

public protocol ViewModeling {

    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
