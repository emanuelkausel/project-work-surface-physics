# -*- coding: utf-8 -*-
"""
Created on Mon Aug 12 11:19:44 2019

@author: Emanuel
"""


def j(Radius,Length,Angle): #j is the angular distribution of the particle ﬂux
    
    import math
    
    R=Radius  #radius of the tube
    L=Length  #length of the tube
    Phi=Angle #angle under which the particle flux is leaving the tube exit
    
    b=2*R/L
    q=L/(2*R)*math.tan(Phi)
    
    a= 0.5 - 1/(3*b*b) * ((1-2*b*b*b+(2*b*b-1)*math.sqrt(1+b*b)) / (math.sqrt(1+b*b)-b*b*(math.log((math.sqrt(1+b*b)+1)/b)))) #wall collision rate a
    
    if Phi>0: #to prevent divide by zero error
        if math.tan(Phi) < b :    #contributions directly from the reservoir and the wall
            J=a*math.cos(Phi)+2/math.pi * math.cos(Phi) * ( (1-a)*(math.acos(q)-q*math.sqrt(1-q*q)) + (2*(1-2*a)/(3*q))*(1-math.sqrt(math.pow((1-q*q),3))))
    
        else: #contributions from the wall only
            J=math.cos(Phi)*(a+(4*(1-2*a))/(3*q*math.pi))
    else: J=1
    return J


if __name__ == "__main__":
    
    import math
    from scipy.integrate import quad
    #import matplotlib.pyplot as plt

    Rad=20e-6  #tube radius 20 microns
    Len=100e-6 #tube Length 100 microns
    
    Deg=25      #exit angle
    Ang=math.radians(Deg) 
    
    n=0.02504e27 #number density (N/V) in the reservoir of an ideal gas
    T=300 #(room)temperature in Kelvin
    
    k=1.380649e-23 #Boltzmann-Constant (Do not change)
    
    radius_coldtrap=0.02 #radius of the entrance hole (inside the coldtrap) to the mass spectrometer
    distance_coldtrap=0.02 #distance between flow source and coldtrap entrance hole
    max_angle=math.atan(radius_coldtrap/distance_coldtrap)
    
    print("\n Tube: length/diameter = ",Len/(2*Rad))
    print("\n Angular distribution number test: \n j(",Deg,") = ",j(Rad,Len,Ang))
    
    def Integrand(Rad,Len,Ang):
        return j(Rad,Len,Ang)*math.sin(Ang) 
    
    Integral=quad(Integrand, 0, max_angle, args=(Rad,Len)) #integrating the distribution function numerically over the solid angle 
    Result=2*math.pi*Integral[0]                           #solid angle element: dOmega=sin(Theta)*dTheta*dPhi  (dPhi evaluates to 2Pi)
    print("\n Integrate j(Theta) dOmega (solid angle): \n Result=",Result)
    
    p=n*Rad*Rad*k*T*Result #derived relation between equivalent pressure and Intensity distribution
    print("\n Calc. pressure: p = ",format(p,".6g"),"Pa")
    p_approximation=n*Rad*Rad*k*T*j(Rad,Len,0) #approximation with max. Intensity on the full entrance hole of the coldtrap
    print("\n Approx. pressure with max. Intensity: \n p = ",format(p_approximation,".6g"),"Pa")

    
    """
    X = [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200]
    Y = [32,36,39,52,61,72,77,75,68,57,48,48]

    plt.scatter(X,Y)

    plt.title('Relationship Between Pressure and Distance')
    plt.xlabel('Distance between flow-source and cold-trap in millimeters [mm]')
    plt.ylabel('Pressure in Pascal [Pa]')

    plt.show()"""