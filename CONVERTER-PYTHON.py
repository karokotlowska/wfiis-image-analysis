import random
import string
import sys
import functools
import math
import glob



convertTab=[[1,"I"],[4,"IV"],[5,"V"],[9,"IX"],[10,"X"],[40,"XL"],[50,"L"],
[90,"XC"],[100,"C"],[400,"CD"],[500,"D"],[900,"CM"],[1000,"M"]]

def f2(n):
  size=len(convertTab)-1
  rzymski=""
  while n>0:
    while convertTab[size][0]>n:
      size-=1
    rzymski+=convertTab[size][1]
    n-=convertTab[size][0]
  return rzymski

#####3


convertTab2 = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}


'''rzymski na arabski'''
def f3(n):
  print (n)
  arabski=0
  for i in range(len(n)):
    if i>0 and convertTab2[n[i]]>convertTab2[n[i-1]]:
      arabski+=convertTab2[n[i]]-2*convertTab2[n[i-1]]
    else:
      arabski+=convertTab2[n[i]]
  return arabski


print(f2(1900)+" MCM")
print(f2(19)+ " IXX")
print(f2(11)+ " XI")
print(f2(507)+" DVII")
print(f2(498)+" CDXCVIII\n\n\n")


print(f3(f2(1900)))
print(f3(f2(19)))
print(f3(f2(11)))
print(f3(f2(507)))
print(f3(f2(498)))

