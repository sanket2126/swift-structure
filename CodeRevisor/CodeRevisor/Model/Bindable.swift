//
//  Bindable.swift
//  CodeRevisor
//
//  Created by Sanket on 28/02/21.
//

import Foundation

class Bindable<T> {
    
    private var dispatch: DispatchSourceTimer?
    
    var value: T? {
        didSet {
            dispatch?.cancel()
            dispatch = DispatchSource.makeTimerSource(queue: .main)
            dispatch?.schedule(deadline: .now() + 0.1)
            dispatch?.setEventHandler(handler: {
                guard let value = self.value else { return }
                self.observerArray.forEach {
                    $0(value)
                }
            })
            dispatch?.resume()
            
            observer?(value) // single
        }
    }
    
    func set(value: T) {
        self.value = value
    }
    
    private lazy var observer: ((T?) -> ())? = nil // single
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer // single
    }
    
    private lazy var observerArray = [((T) -> ())]()
    
    func bindArray(observer: @escaping (T) -> ()) {
        self.observerArray.append(observer)
    }
}
