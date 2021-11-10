//
//  Test2Test.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/7/21.
//

import XCTest
@testable import TestPractice


class Test2Test: XCTestCase {

    
    var usernameValidator: UsernameValidator!
    
    private let student1 = Student(name: "#1", grades: [2.0, 3.5, 4.0])
    private let student2 = Student(name: "#2", grades: [4.0, 4.0, 4.0])
    private var student3 = Student(name: "#3", grades: [1.0, 1.5])
    private var student4 = Student(name: "#4", grades: [])
    private var student5 = Student(name: "#5", grades: [4.0, 4.0, 4.0])
    
    override func setUpWithError() throws {
        usernameValidator = UsernameValidator()
    }

    override func tearDownWithError() throws {
       usernameValidator = nil
    }

    
    func test_UsernameTooSmall_AssertFalseSoShouldWork() {
        let result = usernameValidator.isValid("U1")
        XCTAssertFalse(result)
    }
    
    func test_NoTopStudentsInASchool_ShouldReturnTrue() {
        let school = School(students: [])
        XCTAssertTrue(school.topStudents.isEmpty)
    }
    
    func test_SchoolWithNoTopStudents_ReturnTrue() {
        let school = School(students: [student1, student3, student4])
        XCTAssertTrue(school.topStudents.isEmpty)
    }
    
    func test_TwoStudentsAsTopStudent_ReturnTrue() {
        let school = School(students: [student1, student2, student3, student4, student5])
        let topStudent = school.topStudents
        XCTAssertFalse(topStudent.isEmpty)
        XCTAssertEqual(topStudent.count, 2)
        XCTAssertEqual(topStudent.first?.name, "#2")
        XCTAssertEqual(topStudent.last?.name, "#5")
    }
    
    func test_OnlyOneTopStudent_ReturnTrue() {
        let school = School(students: [student1, student2, student3, student4])
        let topStudent = school.topStudents
        XCTAssertFalse(topStudent.isEmpty)
        XCTAssertEqual(topStudent.count, 1)
        XCTAssertEqual(topStudent.first?.name, "#2")
    }
    
    func test_ShouldReturnNothingIfThereIsNoGPA_ReturnTrue() {
        let student = Student(name: "test", grades: [])
        XCTAssertNil(student.gpa)
    }
    
    func test_IfOneGradeGPAEqualToGrade_ReturnTrue() {
        let student = Student(name: "test", grades: [4.0])
        XCTAssertEqual(student.gpa, 4.0)
    }
    
    func test_AverageGPAWithMultipleGrades_ReturnTrue() {
        let student = Student(name: "test", grades: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])
        XCTAssertEqual(student.gpa, 5.5)
    }
    
    func test_GPAOfExtreamNumbers_ReturnTrue() {
        let student = Student(name: "test", grades: [Float(Int.min), Float(Int.max)])
        XCTAssertEqual(student.gpa, 0)
    }
    
}
