//
//  Test2.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/7/21.
//

import Foundation



struct Student {
    
    let name: String
    
    let grades: [Float]
    
    var gpa: Float? {
        guard !grades.isEmpty else { return nil }
        return grades.reduce(0, +) / Float(grades.count)
    }
    
}

struct School {
    let students: [Student]
    
    var topStudents: [Student] { student(withGPALimit: 4.0)}
    
}

private extension School {
    func student(withGPALimit gpa: Float) -> [Student] {
        students.filter {
            guard let studentGPA = $0.gpa else { return false }
            return studentGPA >= gpa
        }
    }
}

