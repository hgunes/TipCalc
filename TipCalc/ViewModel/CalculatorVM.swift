//
//  CalculatorVM.swift
//  TipCalc
//
//  Created by Harun Gunes on 13/08/2023.
//

import Foundation
import Combine

class CalculatorVM {
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func transform(input: Input) -> Output {
        
        let result = Result(
            amountPerPerson: 500,
            totalBill: 150,
            totalTip: 50)
        
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
}
