
@Model
class QuoteEquity
{

}


/**

QuoteEquity{
description:	
Quote data of Equity security

52WeekHigh	number($double)
example: 145.09
Higest price traded in the past 12 months, or 52 weeks

52WeekLow	number($double)
example: 77.581
Lowest price traded in the past 12 months, or 52 weeks

askMICId	string
example: XNYS
ask MIC code

askPrice	number($double)
example: 124.63
Current Best Ask Price

askSize	integer($int32)
example: 700
Number of shares for ask

askTime	integer($int64)
example: 1621376892336
Last ask time in milliseconds since Epoch

bidMICId	string
example: XNYS
bid MIC code

bidPrice	number($double)
example: 124.6
Current Best Bid Price

bidSize	integer($int32)
example: 300
Number of shares for bid

bidTime	integer($int64)
example: 1621376892336
Last bid time in milliseconds since Epoch

closePrice	number($double)
example: 126.27
Previous day's closing price

highPrice	number($double)
example: 126.99
Day's high trade price

lastMICId	string
example: XNYS
Last MIC Code

lastPrice	number($double)
example: 122.3
lastSize	integer($int32)
example: 100
Number of shares traded with last trade

lowPrice	number($double)
Day's low trade price

mark	number($double)
example: 52.93
Mark price

markChange	number($double)
example: -0.01
Mark Price change

markPercentChange	number($double)
example: -0.0189
Mark Price percent change

netChange	number($double)
example: -0.04
Current Last-Prev Close

netPercentChange	number($double)
example: -0.0756
Net Percentage Change

openPrice	number($double)
example: 52.8
Price at market open

quoteTime	integer($int64)
example: 1621376892336
Last quote time in milliseconds since Epoch

securityStatus	string
example: Normal
Status of security

totalVolume	integer($int64)
example: 20171188
Aggregated shares traded throughout the day, including pre/post market hours.

tradeTime	integer($int64)
example: 1621376731304
Last trade time in milliseconds since Epoch

volatility	number($double)
example: 0.0094
Option Risk/Volatility Measurement

}

*/