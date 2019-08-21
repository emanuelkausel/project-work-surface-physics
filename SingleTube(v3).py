# -*- coding: utf-8 -*-
"""
Created on Mon Aug 12 11:19:44 2019

@author: Emanuel
"""
def p(rad_tube, len_tube, n_fluid, T, rad_ct, dist_ct):
    
    #import math as m
    import numpy as np
    from scipy.integrate import quad
    max_angle=np.arctan(rad_ct/dist_ct)
    k=1.380649e-23
    
    def j(rad_tube,len_tube,angle): #j is the angular distribution of the particle ﬂux
        
        R=rad_tube  #radius of the tube
        L=len_tube  #length of the tube
        Phi=angle #angle under which the particle flux is leaving the tube exit
        
        b=2*R/L
        q=L/(2*R)*np.tan(Phi)
        
        a= 0.5 - 1/(3*b*b) * ((1-2*b*b*b+(2*b*b-1)*np.sqrt(1+b*b)) / (np.sqrt(1+b*b)-b*b*(np.log((np.sqrt(1+b*b)+1)/b)))) #wall collision rate a
        
        if Phi>0: #to prevent divide by zero error
            if np.tan(Phi) < b :    #contributions directly from the reservoir and the wall
                J=a*np.cos(Phi)+2/np.pi * np.cos(Phi) * ( (1-a)*(np.arccos(q)-q*np.sqrt(1-q*q)) + (2*(1-2*a)/(3*q))*(1-np.sqrt(np.power((1-q*q),3))))
        
            else: #contributions from the wall only
                J=np.cos(Phi)*(a+(4*(1-2*a))/(3*q*np.pi))
        else: J=1
        return J

    def Integrand(rad_tube,len_tube,angle): #Integrand is only j(theta)*sin(theta) because everything else has no angle dependency
        return j(rad_tube,len_tube,angle)*np.sin(angle) 
    
    Integral=quad(Integrand, 0, max_angle, args=(rad_tube,len_tube)) #integrating the distribution function numerically over the solid angle 
    Result=2*np.pi*Integral[0]                           #solid angle element: dOmega=sin(Theta)*dTheta*dPhi  (dPhi evaluates to 2Pi)
    
    pressure=n_fluid*rad_tube*rad_tube*k*T*Result #derived relation between equivalent pressure and Intensity distribution
    #print("\n Calc. pressure: p = ",format(pressure,".6g"),"Pa")
    return pressure



if __name__ == "__main__":
    
    
    import matplotlib.pyplot as plt
    k=1.380649e-23
# Here you put in the specifications:             #n=2.504e25 
    rad_tube=20e-6  #tube radius 20 microns
    len_tube=100e-6 #tube Length 100 microns
    T=300 #(room)temperature in Kelvin
    p_reservoir=100000 #initial pressure in the reservoir in Pascal[Pa] intervall: [1000;100000]
    n_fluid=p_reservoir/(k*T)#number density (n=N/V=p/(kT)) in the reservoir of an ideal gas
    print (n_fluid)
    rad_ct=0.001 #radius of the entrance hole (inside the coldtrap) to the mass spectrometer
    dist_ct=0.02 #distance between flow source and coldtrap entrance hole
    print ("Pressure: p =",p(rad_tube,len_tube,n_fluid,T,rad_ct,dist_ct),"[mbar]")
    
    
# 2D plot of the pressure as a function of the distance 
# between flow-source and cold-trap
    X1=[]; Y1=[]
    for distance in range(1,201):
       X1.append(distance) 
       Y1.append(p(rad_tube,len_tube,n_fluid,T,rad_ct,distance/1000)/100) #mbar

    plt.figure(figsize=(18,10))
    plt.scatter(X1,Y1,s=5)
    plt.xlim(0,200)
    plt.ylim(0,2e-10)
    plt.title('Relation between pressure and distance')
    plt.xlabel('Distance between flow-source and cold-trap in millimeters [mm]')
    plt.ylabel('Pressure in millibar [mbar]')
    plt.show()
    
# 2D plot of the pressure as a function of the radius 
# of the entrance hole of the cold-trap
    X2=[]; Y2=[]
    for radius in range(1,201):
       X2.append(radius) 
       Y2.append(p(rad_tube,len_tube,n_fluid,T,radius/1000,dist_ct)/100) #mbar
       
    plt.figure(figsize=(18,10))
    plt.scatter(X2,Y2,s=5)
    plt.xlim(0,200)
    plt.ylim(0,5e-10)
    plt.title('Relation between pressure and radius')
    plt.xlabel('Radius of the entrance hole of the cold-trap in millimeters [mm]')
    plt.ylabel('Pressure in millibar [mbar]')
    plt.show()
  
   
# 3D scatter plot of the pressure as a function of radius of the entrance hole 
# of the cold-trap and distance between flow-source and cold-trap     
    X=[];Y=[];Z=[]
    for radius in range(1,201,5):
        for distance in range(10,201,5):
            X.append(radius)
            Y.append(distance)
            Z.append(p(rad_tube,len_tube,n_fluid,T,radius/1000,distance/1000)/100) #mbar

    import matplotlib.pyplot as plt
    from mpl_toolkits.mplot3d import axes3d, Axes3D
    fig = plt.figure(figsize=(18,10))
    ax = fig.add_subplot(111, projection='3d')

    ax.scatter(X,Y,Z, zdir='z', s=2, c=None, depthshade=True)
    ax.set_xlabel('Radius [mm]')
    ax.set_ylabel('Distance [mm]')
    ax.set_zlabel('Pressure [mbar]')
    plt.show()

    
# Searching for the combination of radius and distance that gives 
# minimal, maximal or optimal pressure
    p_min=Z[0];  i_min=0
    p_max=Z[0];  i_max=0
    p_best=Z[0]; i_best=0 
    
    p_opt=1e-10;  #set optimal pressure for mass spectrometer in mbar
    delta_p=abs(p_opt-Z[0])
    
    for i in range(len(Z)):
        if Z[i]<p_min:
            p_min=Z[i]
            i_min=i
        elif Z[i]>p_max:
            p_max=Z[i]
            i_max=i
        elif abs(p_opt-Z[i])<delta_p:
            p_best=Z[i]
            delta_p=abs(p_opt-Z[i])
            i_best=i
            
    print ("i_min: ",i_min)
    print ("Minimal pressure: ",p_min,"[mbar]")
    print ("Radius: ",X[i_min],"[mm]")
    print ("Distance: ",Y[i_min],"[mm]")
    print ()
    print ("i_max: ",i_max)
    print ("Maximal pressure: ",p_max,"[mbar]")
    print ("Radius: ",X[i_max],"[mm]")
    print ("Distance: ",Y[i_max],"[mm]")
    print ()
    print ("i_best: ",i_best)
    print ("Optimal pressure: ",p_opt,"[mbar]")
    print ("Best possible pressure: ",p_best,"[mbar]")
    print ("Radius: ",X[i_best],"[mm]")
    print ("Distance: ",Y[i_best],"[mm]")
    
 
# 2D plot of the pressure as a function of the initial pressure in the reservoir
    X3=[]; Y3=[]
    for p_reservoir in range(1000,100001,1000): #Pascal
       X3.append(p_reservoir/100) #mbar
       Y3.append(p(rad_tube,len_tube,p_reservoir/(k*T),T,rad_ct,dist_ct)/100) #mbar
       
    plt.figure(figsize=(18,10))
    plt.scatter(X3,Y3,s=5)
    plt.xlim(0,1000)
    plt.ylim(0,2e-11)
    plt.title('Relation between resulting-pressure and reservoir-pressure ')
    plt.xlabel('Initial pressure in the reservoir [mbar]')
    plt.ylabel('Pressure at the hole of the coldtrap [mbar]')
    plt.show()          
     