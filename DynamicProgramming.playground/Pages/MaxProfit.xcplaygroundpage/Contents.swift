import Foundation

// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
class Solution {

  // https://leetcode.com/problems/best-time-to-buy-and-sell-stock/discuss/1932147/100-Fastest-Swift-Solution-time%3A-O(n)-space%3A-O(1).
  // - Complexity:
  //   - time: O(n), where n is the number of prices.
  //   - space: O(1), only constant space is used.

  func maxProfitKadane(_ prices: [Int]) -> Int {
      var minPrice = Int.max
      var ans = 0

      for price in prices {
          minPrice = min(minPrice, price)
          ans = max(ans, price - minPrice)
      }

      return ans
  }



    func maxProfit(_ prices: [Int]) -> Int {

        /*
        loop try buy on each day
            for each buy, loop through everyday in the future, keep track of max profit

        generate another array for best possible future price for a buy on given day
        input [1, 6, 3, 8, 4, 2]
        output, bestFuturePrices [8, 8, 8, 4, 4, 2]

        loop through prices, compary with the bestFuturePrices
        this will be O(n) time, but space will be O(n) as well.
        */

        guard let lastPrice = prices.last else { return 0 }

        var bestFuturePrices: [Int] = [lastPrice]
        for i in (0..<prices.count-1).reversed() {
            if prices[i] > bestFuturePrices.last! {
                bestFuturePrices.append(prices[i])
            }
            else {
                bestFuturePrices.append(bestFuturePrices.last!)
            }
        }
        bestFuturePrices = bestFuturePrices.reversed()
//      print(prices.count)
//      print(bestFuturePrices.count)
//      print(bestFuturePrices)

        var bestProfit = 0
        for i in 0..<prices.count {
            let profit = bestFuturePrices[i] - prices[i]
            if profit > bestProfit {
                bestProfit = profit
//              print(bestProfit)
            }
        }

        return bestProfit
    }
}

Solution().maxProfit([7,1,5,3,6,4])
