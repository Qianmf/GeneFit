# GeneFit
Created by ShanghaiTech iGEM team 2018
Help to find best parameters and components in several gene circuits.
## How to use
- Download all the \*.m files. Inorder to run the program, you need previously install Matlab
- Use main function to do your optimization
- Loop 1 - 5 are five feedback systems. The topology graph is shown in the \*.png files
## Main function
- **re1**                     The optimal parameters
- **re2**                     The distance between system output and expected output
- **Expseq**                  The expected output
- **param**                   A matrix of parameters you want to optimize. The form is 
                              [Index of parameters; 
                              Lower limit;
                              Upper limit]
                              In order to choose the index of parameters, you should read the codes of loop files
- **parastep**                Steps that each parameter is separated into
- **TimeLimit**               If the iteration times reach TimeLimit, the program will return
- **returncondition**         When will the program return (re2 < returncondition)
- **sig**                     The input signal
- **Looptype**                Type of loop, an integer (1, 2, 3, 4, 5)
