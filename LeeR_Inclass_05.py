"""
Inclass 5
Ronald Lee
"""

"""
Inclass 5_1

2. 
	Run iPython and import pandas by typing 'import pandas'.
	By typing pandas.<Tab>, we can see all the commands that start with pandas.
	In pylab, type 'a = numpy.random.randn(100)' so that it can make any random number within 100.
	After this, type 'plot(a.cumsum())', then the plot of 'a' variable comes up.
	
3. 
	In order to find any command that we want to look for, type pandas.*ver*?, for example,
	then it will find out all the commands including 'ver' no matter what letters are before or after 'ver' by using *.
	
8. 
	numpy.random generates whole arrays of sample values from many kinds of probability distributions.
	randn returns a sample or samples from the “standard normal” distribution.
	The type of numbers is float64.
	
9. 
	Return the cumulative sum of the elements along a given axis.
	
10. 
	It takes 24 ns per loop to generate 100 normally distributed random numbers.
	It takes 30.7 ns per loop for generating 1000, and 28.4 ns per loop for generating 10000.
	I made variables a, b, and c that generates 100, 1000, and 10000 random numbers
	,and then type '%timeit a', '%timeit b', '%timeit c'.
	
"""

"""
Inclass 5_2
"""
2.
	arr1 = [ 3.5, 7, 1, 0, 5 ]
	arr2 = [ 2, 10, 7.5, 1, 3 ]
	arr1.shape
	print arr1.shape
	arr2.shape		
	print arr2.shape
	arr1.dtype		
	print arr1.dtype
	arr2.dtype		
	print arr2.dtype
	
3. 
	arr1 + arr2 		output : array([ 5.5, 17., 8.5, 1., 8. ])
	
4.
	arr1 * arr2			output : array([ 7., 70., 7.5, 0., 15. ])
	
5.
	imatrix = eye(6)
	
6.
	imatrix[2] = 5
	
7. 
	s1_b = imatrix[imatrix>0]

8.
	arr3 = np.empty([2,3,4], dtype = int)
	
9.
	print arr3.ndim
	print arr3.shape
	print arr3.dtype
	
10.
	arr3[0][2][1] = 5
	arr3[1][1][1] = 5
	
11.
	arr4 = rand(20)

12. 
	arr4.min()
	arr4.max()
	arr4.sum()
	arr4.mean()
	arr4.std()
	
13. 
	np.where(arr4 < 0.5, 0, 1)
	
14. 
	arr4.sort()

15.
	unique(arr4)
	
"""
Inclass 5_3
"""

5. 

	bitstamp = Quandl.get("BITCOIN/BITSTAMPUSD", trim_start="2014-01-01", trim_end="2014-09-30", authtoken="2_mykey_T")

	bitfinex = Quandl.get("BCHARTS/BITFINEXUSD", trim_start="2014-01-01", trim_end="2014-09-30", authtoken="2_mykey_T")

	LakeBTC = Quandl.get("BCHARTS/LAKEUSD", trim_start="2014-01-01", trim_end="2014-09-30", authtoken="2_mykey_T")

6. 
	bitstamp.head()
	bitfinex.head()
	LakeBTC.head()
	column name : Open / High / Low / Close / Volume <BTC> / Volume <Currency> / Weighted Price
	
7. 
	ind1 = bitstamp.index
	ind2 = bitfinex.index
	ind3 = LakeBTC.index
	
8.
	print ind1
	print ind2
	print ind3
	
9. 
	print ind1.values
	print ind2.values
	print ind3.values
	
	The dtype of each element is datetime64[ns]
	
10.
	print bitstamp.columns
	print bitfinex.columns
	print LakeBTC.columns
	
	There are 7 columns in each DataFrame.
	
11. 
	bitstamp.drop('Volume (BTC)')
	bitfinex.drop('Volume (BTC)')
	LakeBTC.drop('Volume (BTC)')

	