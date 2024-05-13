import model loop_sm-ckm
define wpm = w+ w-
generate p p > t t~ wpm [QCD]
output ttbarz-QCD
launch
order=NLO
fixed_order=ON
set MT 1.725000e+02
set pdlabel lhapdf
set lhaid 27400
set fixed_ren_scale True
set fixed_fac_scale True
set mur_ref_fixed 213.9
set muf_ref_fixed 213.9
set ebeam1 3500
set ebeam2 3500
set reweight_pdf True
set req_acc_fo 0.001
exit
