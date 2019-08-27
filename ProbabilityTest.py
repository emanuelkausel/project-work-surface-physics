# -*- coding: utf-8 -*-
"""
Created on Tue Aug 27 14:26:44 2019

@author: Emanuel
"""

def probability(gamma): 
    
    import math as m
    import numpy as np
    from scipy.integrate import quad
    
    b=1/gamma

    
    def j(angle): #j is the angular distribution of the particle ﬂux
        
           
        Phi=angle #angle under which the particle flux is leaving the tube exit
       
        q=np.tan(Phi)/b
        a= 0.5 - 1/(3*b*b) * ((1-2*b*b*b+(2*b*b-1)*np.sqrt(1+b*b)) / (np.sqrt(1+b*b)-b*b*(np.log((np.sqrt(1+b*b)+1)/b)))) #wall collision rate a
        
        if Phi>0: #to prevent divide by zero error
            if np.tan(Phi) < b :    #contributions directly from the reservoir and the wall
                J=a*np.cos(Phi)+2/np.pi * np.cos(Phi) * ( (1-a)*(np.arccos(q)-q*np.sqrt(1-q*q)) + (2*(1-2*a)/(3*q))*(1-np.sqrt(np.power((1-q*q),3))))
            else: #contributions from the wall only
                J=np.cos(Phi)*(a+(4*(1-2*a))/(3*q*np.pi))
        else: J=1
        return J
  
#Total number of particles / Intensity
    def Integrand2(angle): #Integrand is only j(theta)*sin(theta) because everything else has no angle dependency
        return j(angle)*np.sin(angle) 
    
    Integral2=quad(Integrand2, 0, m.radians(90), args=()) #integrating the distribution function numerically over the solid angle 
    result2=Integral2[0]*2 #times 2 because TransmissionProbability=2*Integral 
   
    return result2




def probtrans(gamma):
    g=gamma
    result = (14+4*g) / (14+18*g+3*g*g)
    return result








if __name__ == "__main__":
    
    import matplotlib.pyplot as plt
    import numpy as np
    
    radius=20e-6
    length=100e-6
    beta=2*radius/length
    gamma=1/beta
    print("beta=",beta,"probability=",probability(gamma))
    
    
    
    # 2D plot of the pressure as a function of the distance 
    # between flow-source and cold-trap
    X1=[]; Y1=[]
    for x in range(1,10000,10):
        gamma=x/100
        X1.append(gamma)
        Y1.append(probability(gamma)) 
        

    plt.figure(figsize=(15,10))
    plt.scatter(X1,Y1,s=5)

    plt.title('probability(gamma)')
    plt.xlabel('gamma')
    plt.ylabel('probability')
    plt.show()
    
    
    
    X2=[]; Y2=[]
    for x in range(1,10000,10):
        gamma=x/100
        X2.append(gamma)
        Y2.append(probtrans(gamma)) 

    plt.figure(figsize=(15,10))
    plt.scatter(X2,Y2,s=5)

    plt.title('transmission probability(gamma)')
    plt.xlabel('gamma')
    plt.ylabel('probability')
    plt.show()