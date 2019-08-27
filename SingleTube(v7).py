# -*- coding: utf-8 -*-
"""
Created on Mon Aug 12 11:19:44 2019

Note: All calculations were made in SI-Units but for practical reasons I used [mbar] instead of [Pa]
when plotting or printing some things

@author: Emanuel
"""
def p(rad_tube, len_tube, n_fluid, T, rad_ct, dist_ct): #pressure at the coldtrap entrance of the mass-spectrometer
    
    import math as m
    import numpy as np
    from scipy.integrate import quad
    import scipy.constants as cnst
    max_angle=np.arctan(rad_ct/dist_ct)
    k=cnst.Boltzmann
    R=rad_tube  #radius of the tube
    L=len_tube  #length of the tube
    b=2*R/L
            
    def j(angle): #j is the angular distribution of the particle ﬂux

        Phi=angle #angle under which the particle flux is leaving the tube exit

        q=L/(2*R)*np.tan(Phi)
        a= 0.5 - 1/(3*b*b) * ((1-2*b*b*b+(2*b*b-1)*np.sqrt(1+b*b)) / (np.sqrt(1+b*b)-b*b*(np.log((np.sqrt(1+b*b)+1)/b)))) #wall collision rate a
        
        if Phi>0: #to prevent divide by zero error
            if np.tan(Phi) < b :    #contributions directly from the reservoir and the wall
                J=a*np.cos(Phi)+2/np.pi * np.cos(Phi) * ( (1-a)*(np.arccos(q)-q*np.sqrt(1-q*q)) + (2*(1-2*a)/(3*q))*(1-np.sqrt(np.power((1-q*q),3))))
        
            else: #contributions from the wall only
                J=np.cos(Phi)*(a+(4*(1-2*a))/(3*q*np.pi))
        else: J=1
        return J

    def Integrand(angle): #Integrand is only j(theta)*sin(theta) because everything else has no angle dependency
        return j(angle)*np.sin(angle) 
    
    Integral=quad(Integrand, 0, max_angle, args=()) #integrating the distribution function numerically over the solid angle 
    result=2*np.pi*Integral[0]                           #solid angle element: dOmega=sin(Theta)*dTheta*dPhi  (dPhi evaluates to 2Pi)
    pressure=n_fluid*R*R*k*T*result #derived relation between equivalent pressure and Intensity distribution  
        
    return pressure





def energyflow(rad_tube, len_tube, n_fluid, T): 
    
    import math as m
    import numpy as np
    from scipy.integrate import quad
    import scipy.constants as cnst
    NA=cnst.Avogadro
    R=rad_tube  #radius of the tube
    L=len_tube  #length of the tube
    b=2*R/L


    def j(angle): #j is the angular distribution of the particle ﬂux
        

        Phi=angle #angle under which the particle flux is leaving the tube exit
        q=L/(2*R)*np.tan(Phi)
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
    result2=2*np.pi*Integral2[0]
    print(Integral2[0])
    intensity_total=result2*n_fluid*v_average*R*R/4 #particles per unit time
    print("Particles per second: ",intensity_total)
    print("Mol per second",intensity_total/NA,"[mol]")
    #H20 has a Std enthalpy change of vaporization of 44kJ/mol
    energy=intensity_total*44000/NA #flow of energy in Joule per unit time [J/s]        
    
    return energy




#throughput of the tube
def throughput(rad_tube,len_tube,pressure_inside,pressure_outside):
    
    import numpy as np
    diameter=2*rad_tube
    cross_section_area=rad_tube*rad_tube*np.pi
    conductance_orifice=v_average/4*cross_section_area
    probabilty_transmission=(14+4*len_tube/diameter)/(14+18*len_tube/diameter+3*len_tube*len_tube/diameter/diameter)
    conductance_tube=conductance_orifice*probabilty_transmission
    throughput_tube=conductance_tube*(pressure_inside-pressure_outside)
    
    return throughput_tube





#calculating the height of the liquid level 
#in a centered outlet tube with a given pressure at the entrance
def liquidlevel(entrance_pressure): 
    p_cell=(entrance_pressure/2-p_vapour)
    level=p_cell/9.80665/density_H2O
    
    return level






if __name__ == "__main__":
    
    
    import matplotlib.pyplot as plt
    import numpy as np
    import scipy.constants as cnst
    k=cnst.Boltzmann
    NA=cnst.Avogadro
    
    
# Here you put in the specifications:             #n=2.504e25 for an ideal gas
    conductivity_therm=2200 #3320 #thermal conductivity of Monocrystalline synthetic diamond (natural would be 2200)
    cell_diameter=0.01 #1cm?
    rad_tube=20e-6  #tube radius 20 microns
    len_tube=100e-6 #tube Length 100 microns
    vol_tube=rad_tube*rad_tube*np.pi*len_tube #volume of the tube
    surf_tube=2*rad_tube*np.pi*len_tube #surface area of the cylinder without top&bottom
    slice_tube=rad_tube*rad_tube*np.pi
    T=300 #(room)temperature in Kelvin
    p_reservoir=3500 #initial pressure in the reservoir in Pascal[Pa] intervall: [1000;100000]
    n_reservoir=p_reservoir/(k*T)#number density (n=N/V=p/(kT)) in the reservoir of an ideal gas
    mass_H2O=18.015/NA/1000 #mass of one single H2O molecule in [kg]
    density_H2O=997 #density of water [kg/m³]
    v_average=np.sqrt((8*k*T)/(np.pi*mass_H2O)) #average velocity of an H20 molecule
    print("v_average=",v_average,"[m/s]")
    print ("n_reservoir=",n_reservoir)
    rad_ct=0.001 #radius of the entrance hole (inside the coldtrap) to the mass spectrometer
    dist_ct=0.02 #distance between flow source and coldtrap entrance hole
    print ("Pressure: p =",p(rad_tube,len_tube,n_reservoir,T,rad_ct,dist_ct),"[mbar]")
    
    
    
# 2D plot of the pressure as a function of the distance 
# between flow-source and cold-trap
    X1=[]; Y1=[]
    for distance in range(1,201):
       X1.append(distance) 
       Y1.append(p(rad_tube,len_tube,n_reservoir,T,rad_ct,distance/1000)/100) #mbar

    plt.figure(figsize=(15,10))
    plt.scatter(X1,Y1,s=5)
    plt.xlim(0,200)
    plt.ylim(0,1e-9)
    plt.title('Relation between pressure and distance')
    plt.xlabel('Distance between flow-source and cold-trap in millimeters [mm]')
    plt.ylabel('Pressure in millibar [mbar]')
    plt.show()
    
# 2D plot of the pressure as a function of the radius 
# of the entrance hole of the cold-trap
    X2=[]; Y2=[]
    for radius in range(1,201):
       X2.append(radius) 
       Y2.append(p(rad_tube,len_tube,n_reservoir,T,radius/1000,dist_ct)/100) #mbar
       
    plt.figure(figsize=(15,10))
    plt.scatter(X2,Y2,s=5)
    plt.xlim(0,200)
    plt.ylim(0,2e-8)
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
            Z.append(p(rad_tube,len_tube,n_reservoir,T,radius/1000,distance/1000)/100) #mbar

    from mpl_toolkits.mplot3d import axes3d, Axes3D
    fig = plt.figure(figsize=(15,10))
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
    for res_press in range(1000,100001,1000): #Pascal
       X3.append(res_press/100) #mbar
       Y3.append(p(rad_tube,len_tube,res_press/(k*T),T,rad_ct,dist_ct)/100) #mbar
       
    plt.figure(figsize=(15,10))
    plt.scatter(X3,Y3,s=5)
    plt.xlim(0,1000)
    plt.ylim(0,0.5e-8)
    plt.title('Relation between resulting-pressure and reservoir-pressure ')
    plt.xlabel('Initial pressure in the reservoir [mbar]')
    plt.ylabel('Pressure at the hole of the coldtrap [mbar]')
    plt.show()       
    
#Calculating Water Vapour Pressure in [Pa] with the Buck Equation (T in Kelvin)
    p_vapour=0.61121*np.exp((18.678-(T-273.15)/234.84)*((T-273.15)/(257.14+(T-273.15))))*1000
    print ("\nVapour pressure of water at a temperatur of",T,"[K]:")
    #print("p_vapour=",p_vapour,"[Pa]")
    print("p_vapour=",p_vapour/100,"[mbar]")
    print("p_reservoir=",p_reservoir/100,"[mbar]    ")

#Calculating temperature change inside the cell via heat flow 
#approximated by a diamond-rod
    delta_x=cell_diameter/2-rad_tube/2
    n_vapour=p_vapour/(k*T)
    
    #method1
    print("\n\nCalculating temperature change by how much energy (per unit time) is leaving the tube")
    print("\nEnergy loss per second=",energyflow(rad_tube,len_tube,n_reservoir,T),"Joule per second")
    lost_energy1=energyflow(rad_tube,len_tube,n_reservoir,T)
    deltaT1=lost_energy1*delta_x/(-surf_tube*conductivity_therm)
    print("Temperatur change=",deltaT1,"[K]")
   
    #method2
    print("\n\nCalculating temperature change by throughput of the tube")
    print("\nThroughput=",throughput(rad_tube,len_tube,p_reservoir,0),"Joule per second")
    number_of_particles=throughput(rad_tube,len_tube,p_reservoir,0)/k/T #number of particles per unit time
    print("Number of particles per second: ",number_of_particles,)
    print("Mol per second: ",number_of_particles/NA,"[mol]")
    lost_energy2=number_of_particles*44000/NA #latent Heat to evaporate water
    print("Energy loss per second=",lost_energy2,"Joule per second")
    deltaT2=lost_energy2*delta_x/(-surf_tube*conductivity_therm)
    print("Temperatur change=",deltaT2,"[K]")
    
    
# Plotting height of the liquid level as a function of entrance pressure
    X4=[]; Y4=[]
    for p_entrance in range(0,10001,50): #Pascal
       X4.append(p_entrance/100) #mbar
       Y4.append(liquidlevel(p_entrance)) #mbar
    
    plt.figure(figsize=(15,10))
    plt.scatter(X4,Y4,s=1)
    plt.xlim(0,100)
    plt.ylim(0,0.2)
    plt.title('Relation between height of liquid-level and entrance-pressure ')
    plt.xlabel('Pressure at the entrance of the cell [mbar]')
    plt.ylabel('Height of the liquid-level [m]')
    plt.show()
    


    
    
    