using Base.Test
using LinearControl

# Test System
A = [1 2 3; 2 1 3; 3 2 1]
B = [1; 0; 0]
C = [0 0 1]
D = [0]

num = [1]
den = [1 2 10]

# State Space
myss = SS(A,B,C,D)

# Transfer Function
mytf = TF(num,den)

# Linear Model
mylm1 = LinearModel(myss)
mylm2 = LinearModel(mytf)
@assert is(mylm1,mylm2)

@assert is(mylm1.tf, mytf)
@assert is(mylm2.ss, myss)
