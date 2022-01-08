//
//  WaitingTimeLabelTest.swift
//  LipaPlannerTests
//
//  Created by Дмитрий Архипов on 21.12.2021.
//

import XCTest

class WaitingTimeLabelTest: XCTestCase {
    func testTodayWaitingTime() throws {
        let current = Date()
        
        let calendar = Calendar.current
        var trainDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: current)

        trainDateComponents.hour = calendar.component(.hour, from: current) + 1
        trainDateComponents.minute = calendar.component(.minute, from: current) + 10
        
        let train = calendar.date(from: trainDateComponents)!
        
        let ( waitingTime, _ ) = train.waitingTime
        
        XCTAssertEqual(waitingTime, String("Через 1 ч 10 мин").uppercased())
    }
    
    func testTomorrowWaitingTime() throws {
        let current = Date()
        
        let calendar = Calendar.current
        var trainDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: current)

        trainDateComponents.hour = calendar.component(.hour, from: current)
        trainDateComponents.minute = calendar.component(.minute, from: current) - 1
        
        let train = calendar.date(from: trainDateComponents)!
        
        let ( waitingTime, _ ) = train.waitingTime
        
        XCTAssertEqual(waitingTime, String("Завтра").uppercased())
    }
    
    func testNowWaitingTime() throws {
        let ( waitingTime, _ ) = Date().waitingTime

        XCTAssertEqual(waitingTime, String("Сейчас").uppercased())
    }
}
