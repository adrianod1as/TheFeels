//
//  RxDispatcher.swift
//  Networking
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift
import OxeNetworking

public protocol RxDispatcher: Dispatcher where Self: ReactiveCompatible, ReactiveBase: Dispatcher {}
