import UIKit
import Combine

/* For this challenge we are required to:
        1. Skip the first 50 values
        2. Take the next 20 values after that only
        3. Only take even numbers

 This challenge was adapted from a Raywenderlich challenge for this course to test
 usage of HOF in Combine
 */

let numbers = (1...100).publisher

numbers.dropFirst(50).prefix(20).filter { $0 % 2 == 0 }.sink {
    print($0)
}
