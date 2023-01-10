//
//  LoginViewModel.swift
//  BindingMVVM
//
//  Created by Marco Alonso Rodriguez on 10/01/23.
//

import Foundation

//Generic Binding VM to work with any type
class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener : Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(callback: @escaping (T) -> Void) {
        self.listener = callback
    }
    
    init(_ value : T) {
        self.value = value
    }
}

struct LoginViewModel {
    var username =  Dynamic("")
    var password =  Dynamic("")
    
    //when properties will change, it will triger this
}
