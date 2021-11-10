//
//  Test8Test.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/10/21.
//

import XCTest
@testable import TestPractice

class Test8Test: XCTestCase {
    
    private var account: Account!
    
    

    override func setUpWithError() throws {
        super.setUp()
        self.account = Account()
        self.account.balance = 100.0
    }

    override func tearDownWithError() throws {
        self.account = nil
        
    }

    //when first create account, we want the initial amount to be 0
    func test_InitialBalanceZero() {
        XCTAssertTrue(self.account.balance == 100, "Balance is not zero")
    }
    
    
    func testDepositFunds() {
        self.account.deposit(100)
        XCTAssertEqual(200, account.balance)
    }
    
    
    func test_WidthdrawFundsToFifty_Successful() {
        try? self.account.widthdraw(50)
        XCTAssertEqual(50, account.balance)
    }
    
    func test_WidthdrawFunds_FailDueToInsignificantAmount() {
        XCTAssertThrowsError(try self.account.widthdraw(300)) { error in
            XCTAssertEqual(error as! AccountError, AccountError.insufficientFunds)
        }
    }
    
    
    
    
}
