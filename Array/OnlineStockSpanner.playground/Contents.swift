/*
 Design an algorithm that collects daily price quotes for some stock and returns the span of that stock's price for the current day.

 The span of the stock's price in one day is the maximum number of consecutive days (starting from that day and going backward) for which the stock price was less than or equal to the price of that day.

 For example, if the prices of the stock in the last four days is [7,2,1,2] and the price of the stock today is 2, then the span of today is 4 because starting from today, the price of the stock was less than or equal 2 for 4 consecutive days.
 Also, if the prices of the stock in the last four days is [7,34,1,2] and the price of the stock today is 8, then the span of today is 3 because starting from today, the price of the stock was less than or equal 8 for 3 consecutive days.
 Implement the StockSpanner class:

 StockSpanner() Initializes the object of the class.
 int next(int price) Returns the span of the stock's price given that today's price is price.
 
 https://leetcode.com/problems/online-stock-span/description/?envType=study-plan-v2&envId=leetcode-75
 */

class StockSpanner {
    
    typealias Price = Int
    typealias Span = Int
    
    var stack = [(Price,Span)]()
    
    func next(_ price: Int) -> Int {
        var span = 1
        
        while !stack.isEmpty && stack.last!.0 <= price {
            span += stack.removeLast().1
        }
        stack.append((price, span))
        return span
    }
}
let stock = StockSpanner()
print(stock.next(100))
print(stock.next(80))
print(stock.next(60))
print(stock.next(70))
print(stock.next(60))
print(stock.next(75))
print(stock.next(85))
