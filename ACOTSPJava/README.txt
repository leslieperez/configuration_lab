ACOTSPJava
==========

A Java implementation of ACO algorithms for the TSP

Version: 1.0.3-1.0.1



About
-----

This software provides an implementation of various Ant Colony Optimization
(ACO) algorithms for the symmetric Traveling Salesman Problem (TSP).

It is based on the ACOTSP project of Thomas Stuetzle: 'ACO algorithms for the
TSP'. See ACOTSP-1.03.README.txt for further information.

The original code was ported from C to Java by Adrian Wilke. This was done for
a project of the course 'Swarm intelligence' of Marco Dorigo at the University
of Paderborn.

A short introduction to ACO is included in this paper:  
Peter Janacik, Dalimir Orfanus, and Adrian Wilke. A Survey of Ant Colony
Optimization-Based Approaches to Routing in Computer Networks. In Fourth
International Conference on Intelligent Systems, Modelling and Simulation
(ISMS), pages 427-432, 2013.  
http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=6498308

The website of the ACOTSPJava project is available at  
http://adibaba.github.io/ACOTSPJava/



Usage
-----

You need to install the Java Runtime Environment  
http://www.java.com/en/download/manual.jsp

Use this command to get available options:  
java -jar ACOTSPJava.jar --help

For a short test run, use this command:  
java -jar ACOTSPJava.jar -acs -tries 3 -tours 10 -time 3 -i tsp/eil51.tsp

Further information is provided in the file ACOTSP-1.03.README.txt.



Files
-----

- ACOTSP-1.03.README.txt       Readme of the original ACOTSP v1.03
- ACOTSPJava.jar               The main ACOTSPJava file
- commons-cli-1.2.jar          Apache Commons CLI 1.2
- commons-cli-1.2.LICENSE.txt  Apache License v2.0 of Apache Commons CLI 1.2
- commons-cli-1.2.NOTICE.txt   Authors notice of Apache Commons CLI 1.2 
- LICENSE.txt                  ACOTSPJava license GNU GPL 2
- README.txt                   This file
- tsp/                         A directory with Some problem instances from TSPLIB  
                  http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/index.html
