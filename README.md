# Quantum-Evolutionary-Algorithm-Knapsack-
This project is the Classic version of Quantum Evolutionary Algorithm (QEA) which finds a solution for "Knapsack" problem.
This implementation is designed based on the transaction paper called "Quantum-inspired evolutionary algorithm for a class of combinatorial optimization" by Kuk-Hyun Han and Jong-Hwan Kim. Paper link: https://ieeexplore.ieee.org/abstract/document/1134125
- Team members:
1. Majid Beheshti Mohtasham
2. Jamshid Sabet Navokh
3. Mohammad Mobasher Kashani
4. Mohammad.H Tayarani

This code is the *"basic"* type of QEA which employed in the following publications. For every paper the idea's code is implemented as well, to  compare with the basic QEA:
* [*"A statistical analyzing approach for Quantum Evolutionary Algorithms."* In 2011 19th Iranian Conference on Electrical Engineering, pp. 1-6. IEEE, 2011.](https://ieeexplore.ieee.org/abstract/document/5955671)
* [*"A novel initialization for quantum evolutionary algorithms based on spatial correlation in images for fractal image compression."* In Soft Computing in Industrial Applications, pp. 317-325. Springer, Berlin, Heidelberg, 2011.](https://link.springer.com/chapter/10.1007/978-3-642-20505-7_28)
* [*"A New Initialization Method and a New Update Operator for Quantum Evolutionary Algorithms in Solving Fractal Image Compression."* In International Conference on Innovative Computing Technology, pp. 401-413. Springer, Berlin, Heidelberg, 2011.](https://link.springer.com/chapter/10.1007/978-3-642-27337-7_38)
* [*"Improvement of the Performance of QEA Using the History of Search Process and Backbone Structure of Landscape."* In International Conference on Innovative Computing Technology, pp. 389-400. Springer, Berlin, Heidelberg, 2011.](https://link.springer.com/chapter/10.1007/978-3-642-27337-7_37)
* [*"A Simulated Annealing inspired update Gate for Quantum Evolutionary Algorithm."*](http://www.academia.edu/download/34535318/A_Simulated_Annealing_inspired_update_Gate_for_Quantum_Evolutionary_Algorithm1.pdf)
* [*"A New Two-Phase Hybrid Evolutionary Algorithm for Fractal Image Compression."*](http://www.academia.edu/download/34535307/2PhaseQEA.pdf)

For running we need:
* Matlab 2009 or later versions
* Windows XP,7,Vista,8,10
* Inpute file which shoud be with *.txt* extension

List of related Matlab files:
* QGA.m
* Knapsack_quantum.m
* Knapsack_fitness.m
* Knapsack_observe.m
* Knapsack_repair.m
* isconvergence.m

Input files:
* 100.txt (knapsack problem with 100 items)
* 500.txt (knapsack problem with 500 items)

Running:
- By running QGA.m function which is the main function of the algorithm the QEA begins. 
- Knapsack_quantum.m is the next important function of the algorithm which runs the QEA baed on the first configurations are done in the main file. 
- Knapsack_observe.m is the function for calculating the binary individuals from probabilities. 
- Knapsack_repair.m repairs the current solution.
- Knapsack_fitness.m produce the fitness based on the selected items. 
- isconvergence.m checks if the probabilities of the individuals are conveged or not.

Output files:
- fig.fig: shows the mean of performance after n runs during the defined iterations.
- res.txt : includes the final fitness of algorithm which is the mean of n runs. 
- time.txt: includes the run-time of the QEA in seconds.
- All the output file are written in *new* folder.
