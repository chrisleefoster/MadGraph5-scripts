def my_function(data,i):
    nloInput = data[3]
    nlo = nloInput.split("  ")
    cs_nlo      =   float(nlo[3])
    nlo_m_scale =   float(nlo[6])
    nlo_p_scale =   float(nlo[7])
    nlo_m_pdf   =   float(nlo[9])
    nlo_p_pdf   =   float(nlo[10])
    with open('NLO_cross-sections.dat', 'a') as f:
        f.write(f"{i}\t{cs_nlo}\t{nlo_m_scale}\t{nlo_p_scale}\t{nlo_m_pdf}\t{nlo_p_pdf}\n")
    
    loInput = data[12]
    lo = loInput.split("  ")
    cs_lo      =   float(lo[3])
    lo_m_scale =   float(lo[6])
    lo_p_scale =   float(lo[7])
    lo_m_pdf   =   float(lo[9])
    lo_p_pdf   =   float(lo[10])
    with open('LO_cross-sections.dat', 'a') as f:
        f.write(f"{i}\t{cs_lo}\t{lo_m_scale}\t{lo_p_scale}\t{lo_m_pdf}\t{lo_p_pdf}\n")

energies = [7,8,9,10,11,12,13,13.6,14]
rawCrossSections = [0] * len(energies)
for i in energies:
    string = f'{i}TeV/QCD.HwU'
    with open(string,'r') as f:
        rawCrossSections[energies.index(i)] = f.readlines()
    my_function(rawCrossSections[energies.index(i)],i)
        
