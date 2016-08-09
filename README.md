# Extended nonlocal games and monogamy-of-entanglement games : Theory seminar talk
## Version 0.0.1 - 11 August 2016

Supplemental MATLAB scripts for the theory seminar talk on monogamy-of-entanglement games.

## Talk Abstract

Two-player one-round games have served to be an instrumental model in theoretical computer science. 
Likewise, nonlocal games consider this model when the players have access to an entangled quantum state. 
In this talk, I will consider a broader class of nonlocal games (extended-nonlocal games), where the 
referee shares an entangled state along with the players. We will pay particular attention to a type of 
extended nonlocal game called monogamy-of-entanglement games. Throughout the talk, there will be code 
examples to help us understand these games. The code will make use of MATLAB, and a particularly nice 
package called QETLAB, which is a library primarily written by Nathaniel Johnston (http://www.nathanieljohnston.com/) 
for studying quantum information. 

## Dependencies

1. [MATLAB](http://www.mathworks.com/products/matlab/) (free if UW student check IST Software Portal),
2. [CVX](http://cvxr.com/cvx/download/) (free MATLAB package),
3. [QETLAB](http://www.qetlab.com/Main_Page) (free MATLAB package).
4. The software on this page. 

In order to run, place the QETLAB folder, CVX folder, and the content from this repository into a folder in your MATLAB working directory. 
Once you add the folder to your working directory, you are ready to run the examples. 

## Description

This set of scripts makes heavy use of the QETLAB package to study nonlocal games, and more specifically, 
the class of monogamy-of-entanglement games as is the focus of this talk / software. 

## Misc. Links:

1. [Information Systems & Technology website](https://uwaterloo.ca/information-systems-technology/services/software-faculty-and-staff/licensed-software-university-waterloo):
Consult this site to find out how you can obtain a university MATLAB license if you don't already have it. 
2. [Nathaniel Johnston QETLAB blog post](http://www.njohnston.ca/2015/04/introducing-qetlab-a-matlab-toolbox-for-quantum-entanglement/) A quick start guide to QETLAB
written by Nathaniel Johnston on his blog. 
3. [How to cite QETLAB](http://www.qetlab.com/How_to_cite)

### References:

[1] "A monogamy of entanglement game with applications to device independent quantum cryptography",
     
	  M. Tomamichel, S. Fehr, J. Kaniewski, S. Wehner.,
	  
	  New Journal of Physics, IOP Publishing, 2013, 15, 103002,
	  
	  ArXiv: [arxiv:1210.4359](http://arxiv.org/abs/1210.4359)

[2] "Extended nonlocal games and monogamy-of-entanglement games", 

	N. Johnston, R. Mittal, V. Russo, J. Watrous,
	
	Proc. R. Soc. A, 2016, 472, 20160003, 2016,

	ArXiv: [arxiv:1510.02083](https://arxiv.org/abs/1510.02083)
	 	 